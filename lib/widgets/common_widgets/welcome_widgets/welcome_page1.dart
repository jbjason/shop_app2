import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_2.dart';
import 'package:shop_app2/constants/theme.dart';

class WelcomePage1 extends StatelessWidget {
  const WelcomePage1({
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
          top: size.height * .62,
          left: size.width * .06,
          child: welcomeText1HighLight(),
        ),
        Positioned(
          top: size.height * .7,
          left: size.width * .18,
          right: size.width * .1,
          child: welcomeText1(),
        ),
      ],
    );
  }

  Widget _image(double rotate, String image, Size size) => Transform.rotate(
        angle: rotate,
        child: Container(
          width: size.width * .85,
          height: size.height * .4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.secondary, width: 3),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
      );
}
