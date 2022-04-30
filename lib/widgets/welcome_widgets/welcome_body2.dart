import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class WelcomeBody2 extends StatelessWidget {
  const WelcomeBody2({Key? key, required this.image, required this.text})
      : super(key: key);
  final String image, text;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          top: size.height * .7,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            child: Text(text,
                style:
                    const TextStyle(fontSize: 13, color: AppColors.textLigth)),
          ),
        ),
      ],
    );
  }
}
