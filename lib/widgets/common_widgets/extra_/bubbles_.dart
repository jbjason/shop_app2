import 'package:flutter/material.dart';

class Bubbles extends StatelessWidget {
  const Bubbles(
      {Key? key,
      required this.bigBubble,
      required this.rightBubble,
      required this.leftBubble,
      required this.smallBubble})
      : super(key: key);
  final Color bigBubble, smallBubble, rightBubble, leftBubble;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _biggerWhite(),
        _middleWhite(),
        _smallWhite(),
        _thirdTop(),
        _secondTopColor(),
        _topColor(),
      ],
    );
  }

  Widget _topColor() => Positioned(
        bottom: -40,
        right: -40,
        child: Container(
          height: 160,
          width: 145,
          decoration: BoxDecoration(
              color: smallBubble.withOpacity(0.2), shape: BoxShape.circle),
        ),
      );
  Widget _secondTopColor() => Positioned(
        bottom: -40,
        right: -40,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: rightBubble.withOpacity(0.14), shape: BoxShape.circle),
        ),
      );

  Widget _thirdTop() => Positioned(
        bottom: -40,
        right: -40,
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              color: leftBubble.withOpacity(0.1), shape: BoxShape.circle),
        ),
      );

  Widget _smallWhite() => Positioned(
        bottom: -40,
        right: -40,
        child: Container(
          height: 330,
          width: 330,
          decoration: BoxDecoration(
              color: bigBubble.withOpacity(0.3), shape: BoxShape.circle),
        ),
      );
  Widget _middleWhite() => Positioned(
        bottom: -40,
        right: -40,
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
              color: bigBubble.withOpacity(0.27), shape: BoxShape.circle),
        ),
      );
  Widget _biggerWhite() => Positioned(
        bottom: -40,
        right: -40,
        child: Container(
          height: 470,
          width: 470,
          decoration: BoxDecoration(
              color: bigBubble.withOpacity(0.17), shape: BoxShape.circle),
        ),
      );
}
