import 'package:flutter/material.dart';

class Bubbles extends StatelessWidget {
  const Bubbles(
      {Key? key,
      required this.bigBubble,
      required this.secondBubble,
      required this.smallBubble})
      : super(key: key);
  final Color bigBubble, smallBubble, secondBubble;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _biggerWhite(),
        _middleWhite(),
        _secondTopColor(),
      ],
    );
  }

  Widget _secondTopColor() => Positioned(
        bottom: -55,
        right: -60,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: secondBubble.withOpacity(0.14), shape: BoxShape.circle),
        ),
      );
  Widget _middleWhite() => Positioned(
        bottom: -55,
        right: -60,
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
              color: bigBubble.withOpacity(0.27), shape: BoxShape.circle),
        ),
      );
  Widget _biggerWhite() => Positioned(
        bottom: -55,
        right: -60,
        child: Container(
          height: 470,
          width: 470,
          decoration: BoxDecoration(
              color: bigBubble.withOpacity(0.17), shape: BoxShape.circle),
        ),
      );
}
