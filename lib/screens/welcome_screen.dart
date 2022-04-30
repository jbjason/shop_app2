import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/welcome_widgets/welcome_body.dart';

class WelcomeScreen extends StatelessWidget {
 WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF5c677d),
        body: Stack(
          children: [
            ClipPath(
              clipper: WelcomeClipper(),
              child: Container(
                child: const WelcomeBody(),
                height: size.height,
                width: size.width,
                margin: const EdgeInsets.all(5),
                decoration: _decoration,
              ),
            ),
            Positioned(
                top: size.height * .76, left: 0, child: _swipeText('↞swipe')),
            Positioned(
                top: size.height * .76, right: 0, child: _swipeText('swipe↠')),
          ],
        ),
      ),
    );
  }

  Widget _swipeText(String s) => Text(s, style: const TextStyle(fontSize: 13));
  
  final _decoration = BoxDecoration(
    border: Border.all(color: Colors.white.withOpacity(0.8)),
    borderRadius: BorderRadius.circular(10),
    gradient: LinearGradient(colors: [
      Colors.white.withOpacity(0.4),
      Colors.white.withOpacity(0.1),
    ]),
  );
}

class WelcomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width, h = size.height;
    path.lineTo(0, h * .7);
    path.quadraticBezierTo(125, h * .8, 0, h * .9);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, h * .9);
    path.quadraticBezierTo(w - 125, h * .8, w, h * .7);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
