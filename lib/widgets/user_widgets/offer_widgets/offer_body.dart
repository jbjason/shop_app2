import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_others.dart';

class OfferBody extends StatelessWidget {
  final double rotation;
  final Size size;
  final String image;
  const OfferBody(
      {Key? key,
      required this.rotation,
      required this.size,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fixRotation = pow(rotation, 0.35);
    return Center(
      child: Stack(
        children: [
          Container(
            height: size.height * .5,
            width: size.width * .65,
            decoration: BoxDecoration(
                boxShadow: getShadowBox(Colors.grey[300]!, Colors.white)),
          ),
          Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateY(1.78 * fixRotation) // 1.8
              ..translate(-rotation * size.width * 0.8)
              ..scale(1 + rotation),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: size.height * .5,
              width: size.width * .65,
            ),
          ),
        ],
      ),
    );
  }
}
