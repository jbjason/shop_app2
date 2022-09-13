import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/widgets/auth_widgets/auth_body.dart';
import 'package:shop_app2/widgets/common_widgets/bubbles_.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _pageKey = ModalRoute.of(context)!.settings.arguments as String;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/m3_.jpg'), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            const Bubbles(
              bigBubble: Colors.white,
              smallBubble: AppColors.accent,
              secondBubble: AppColors.secondary,
            ),
            AuthBody(pageKey: _pageKey),
          ],
        ),
      ),
    );
  }
}
