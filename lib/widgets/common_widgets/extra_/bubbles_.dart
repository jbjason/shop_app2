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
        _bottomBlue1(),
        _bottomBlue2(),
        _bottomWhite(),
        _bottomWhiteLeft(),
        _bottomBlueLeft(),
      ],
    );
  }

  Widget _bottomWhite() => Positioned(
        bottom: -50,
        right: -100,
        child: Container(
          height: 450,
          width: 450,
          decoration: BoxDecoration(
              color: bigBubble.withOpacity(0.2), shape: BoxShape.circle),
        ),
      );
  Widget _bottomBlue1() => Positioned(
        bottom: -80,
        right: -40,
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              color: rightBubble.withOpacity(0.2), shape: BoxShape.circle),
        ),
      );
  Widget _bottomBlue2() => Positioned(
        bottom: 80,
        right: -80,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: smallBubble.withOpacity(0.2), shape: BoxShape.circle),
        ),
      );
  Widget _bottomWhiteLeft() => Positioned(
        bottom: -40,
        left: -50,
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              color: bigBubble.withOpacity(0.3), shape: BoxShape.circle),
        ),
      );
  Widget _bottomBlueLeft() => Positioned(
        bottom: -30,
        left: -80,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: leftBubble.withOpacity(0.1), shape: BoxShape.circle),
        ),
      );
}
