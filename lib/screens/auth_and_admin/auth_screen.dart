import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/auth_body.dart';

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
              image: AssetImage('assets/m3.jpg'), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            _bottomWhite(),
            _bottomBlue1(),
            _bottomBlue2(),
            _bottomWhiteLeft(),
            _bottomBlueLeft(),
            AuthBody(pageKey: _pageKey),
          ],
        ),
      ),
    );
  }

  Widget _bottomWhite() => Positioned(
        bottom: -50,
        right: -100,
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
        ),
      );
  Widget _bottomBlue1() => Positioned(
        bottom: -80,
        right: 0,
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 45, 75).withOpacity(0.3),
              shape: BoxShape.circle),
        ),
      );
  Widget _bottomBlue2() => Positioned(
        bottom: 80,
        right: -80,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 45, 75).withOpacity(0.2),
              shape: BoxShape.circle),
        ),
      );
  Widget _bottomWhiteLeft() => Positioned(
        bottom: -40,
        left: -50,
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
        ),
      );
  Widget _bottomBlueLeft() => Positioned(
        bottom: 80,
        left: -80,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 45, 75).withOpacity(0.2),
              shape: BoxShape.circle),
        ),
      );
}
