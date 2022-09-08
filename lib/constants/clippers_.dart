import 'package:flutter/material.dart';

class WelcomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width, h = size.height;
    final path = Path();
    path.lineTo(0, h * .6);

    final double px1 = 0, py1 = h * .75;
    final double px2 = w * .14, py2 = h * .75;
    final double px3 = w * .14, py3 = h * .81;
    path.cubicTo(px1, py1, px2, py2, px3, py3);

    final double qx1 = w * .14, qy1 = h * .85;
    final double qx2 = 0, qy2 = h * .85;
    final double qx3 = 0, qy3 = h;

    path.cubicTo(qx1, qy1, qx2, qy2, qx3, qy3);
    path.lineTo(0, h);

    path.lineTo(w, h);

    final double rx1 = w, ry1 = h * .85;
    final double rx2 = w * .86, ry2 = h * .85;
    final double rx3 = w * .86, ry3 = h * .8;
    path.cubicTo(rx1, ry1, rx2, ry2, rx3, ry3);

    final double sx1 = w * .86, sy1 = h * .76;
    final double sx2 = w, sy2 = h * .7;
    final double sx3 = w, sy3 = h * .6;
    path.cubicTo(sx1, sy1, sx2, sy2, sx3, sy3);

    path.lineTo(w, h * .6);
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
