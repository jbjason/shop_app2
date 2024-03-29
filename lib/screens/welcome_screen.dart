import 'package:flutter/material.dart';
import 'package:shop_app2/constants/clippers_.dart';
import 'package:shop_app2/constants/constants_welcome.dart';
import 'package:shop_app2/widgets/common_widgets/welcome_widgets/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ClipPath(
              clipper: WelcomeClipper(),
              child: Container(
                  child: const WelcomeBody(),
                  height: size.height,
                  width: size.width,
                  decoration: _decoration),
            ),
            Positioned(
                top: size.height * .76, left: 0, child: swipeText('↞swipe')),
            Positioned(
                top: size.height * .76, right: 0, child: swipeText('swipe↠')),
          ],
        ),
      ),
    );
  }

  final _decoration = BoxDecoration(
    border: Border.all(width: 3, color: Colors.white),
    borderRadius: BorderRadius.circular(40),
    gradient: LinearGradient(colors: [
      Colors.grey[700]!.withOpacity(0.6),
      Colors.grey[700]!.withOpacity(0.2),
    ]),
  );
}
