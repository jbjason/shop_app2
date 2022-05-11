import 'package:flutter/material.dart';

class WelcomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width, h = size.height;
    // path.lineTo(0, h * .7);
    // path.quadraticBezierTo(120, h * .8, 0, h * .9);
    // path.lineTo(0, h);
    // remove previous 3 lines
    path.lineTo(0, h * .6);
    path.quadraticBezierTo(120, h * .8, 0, h);
    path.lineTo(w, h);
    // path.lineTo(w, h * .9);
    // path.quadraticBezierTo(w - 120, h * .8, w, h * .7);
    // remove previous 2 lines
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
      ..cubicTo(w5 - 40, 0, w5 - 50, h5, w5 - 3, h6)
      ..lineTo(w5, h)
      ..lineTo(w5 + 5, h)
      ..quadraticBezierTo(w5 + 80, h - 45, w5 + 150, h)
      ..lineTo(w, h)
      ..quadraticBezierTo(w - 60, h / 2, w, 0)
      ..lineTo(w5 + 80, 0)
      ..cubicTo(w5 + 40, 0, w5 + 50, h5, w5 + 3, h6)
      ..lineTo(w5 - 3, h6)
      ..lineTo(w5, h)
      ..lineTo(w5 - 5, h)
      ..quadraticBezierTo(w5 - 80, h - 45, w5 - 150, h)
      ..lineTo(0, h)
      ..quadraticBezierTo(60, h / 2, 0, 0);
    //canvas.drawShadow(path, Colors.black26, 10, false);
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
