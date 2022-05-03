import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_2.dart';

class WelcomeBody1 extends StatelessWidget {
  const WelcomeBody1({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
            top: 50,
            right: -110,
            child: _image(-10 * pi / 180, 'assets/s11.jpg', size)),
        Positioned(
          top: 15,
          left: -110,
          child: _image(10 * pi / 180, 'assets/s4.jpg', size),
        ),
        Positioned(
          top: size.height * .53,
          left: 60,
          right: 40,
          child: welcomeText1(),
        ),
      ],
    );
  }

  Widget _image(double rotate, String image, Size size) => Transform.rotate(
        angle: rotate,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: size.width * .85,
            height: size.height * .4,
          ),
        ),
      );
}