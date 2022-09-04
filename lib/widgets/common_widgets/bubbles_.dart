import 'package:flutter/material.dart';

class Bubbles extends StatelessWidget {
  const Bubbles(
      {Key? key,
      required this.page,
      required this.bigBubble,
      required this.secondBubble,
      required this.smallBubble})
      : super(key: key);
  final Color bigBubble, smallBubble, secondBubble;
  final String page;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (page == 'auth') _atTopColor(),
        _biggerWhite(),
        _middleWhite(),
        _smallWhite(),
        _thirdTop(),
        _secondTopColor(),
        _bottomTopColor(),
      ],
    );
  }

  Widget _atTopColor() => Positioned(
        top: -150,
        right: -150,
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(.2),
          ),
        ),
      );

  Widget _bottomTopColor() => Positioned(
        bottom: -55,
        right: -60,
        child: Container(
          height: 160,
          width: 145,
          decoration: BoxDecoration(
              color: smallBubble.withOpacity(0.2), shape: BoxShape.circle),
        ),
      );
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
  Widget _thirdTop() => Positioned(
        bottom: -55,
        right: -60,
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              color: secondBubble.withOpacity(0.1), shape: BoxShape.circle),
        ),
      );
  Widget _smallWhite() => Positioned(
        bottom: -55,
        right: -60,
        child: Container(
          height: 330,
          width: 330,
          decoration: BoxDecoration(
              color: bigBubble.withOpacity(0.3), shape: BoxShape.circle),
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
