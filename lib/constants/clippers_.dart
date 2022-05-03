import 'package:flutter/material.dart';

class WelcomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width, h = size.height;
    path.lineTo(0, h * .7);
    path.quadraticBezierTo(120, h * .8, 0, h * .9);
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, h * .9);
    path.quadraticBezierTo(w - 120, h * .8, w, h * .7);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class NavClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final h5 = h * .5, w5 = w * .5;
    final h6 = h * .6;
    final path = Path()
      //..lineTo(3, 0)
      //..quadraticBezierTo(w * .15, h, w * .3 - 5, 0)
      ..lineTo(w5 - 80, 0)
      ..cubicTo(w5 - 40, 0, w5 - 50, h5, w5 - 3, h6)
      ..lineTo(w5, h)
      ..lineTo(w, h)
      ..quadraticBezierTo(w - 50, h / 2, w, 0)
      //..lineTo(w - 3, 0)
      //..quadraticBezierTo(w * .85, h, w * .7 + 5, 0)
      ..lineTo(w5 + 80, 0)
      ..cubicTo(w5 + 40, 0, w5 + 50, h5, w5 + 3, h6)
      ..lineTo(w5 - 3, h6)
      ..lineTo(w5, h)
      ..lineTo(0, h)
      ..quadraticBezierTo(50, h / 2, 0, 0);
    canvas.drawShadow(path, Colors.black26, 10, false);
    canvas.drawPath(
        path, Paint()..color = const Color.fromARGB(255, 224, 233, 248));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width, h = size.height;
    final path = Path();
    path.lineTo(0, h - 105);
    path.quadraticBezierTo(40, h - 60, 80, h - 60);
    path.lineTo(w - 80, h - 60);
    path.quadraticBezierTo(w, h - 60, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
