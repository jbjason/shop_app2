import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/auth_body.dart';
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
              smallBubble: Color.fromARGB(255, 45, 45, 75),
              leftBubble: Color.fromARGB(255, 74, 107, 76),
            ),
            AuthBody(pageKey: _pageKey),
          ],
        ),
      ),
    );
  }
}
