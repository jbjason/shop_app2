import 'package:flutter/material.dart';

class WelcomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width, h = size.height;
    path.lineTo(0, h * .6);
    path.quadraticBezierTo(120, h * .8, 0, h);
    path.lineTo(w, h);
    path.quadraticBezierTo(w - 120, h * .8, w, h * .6);
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
      ..lineTo(w5 - 80, 0)
      ..cubicTo(w5 - 40, 0, w5 - 50, h5, w5, h6)
      ..cubicTo(w5 + 40, h6, w5 + 50, 0, w * .7, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h)
      ..lineTo(0, h);
    path.close();
    canvas.drawShadow(path, Colors.black26, 10, false);
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width, h = size.height;
    final path = Path();
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.cubicTo(w, h * .7, 0, h * .9, 0, h * .55);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
