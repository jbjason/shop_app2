import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// THis is for Others Screen
Widget buttonBackGround(Widget child) => Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
      child: child,
    );

Widget getButtonDecoration(double height, double width, BoxShape _shape,
    List<BoxShadow> _shadow, Widget child) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      shape: _shape,
      gradient: SweepGradient(
        startAngle: 2,
        colors: [Colors.grey[850]!, Colors.blue[200]!],
      ),
      boxShadow: _shadow,
    ),
    child: Padding(padding: const EdgeInsets.all(10), child: child),
  );
}

Widget getAppBarTile(String s, BuildContext context) => SizedBox(
      height: 40,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 10),
          Text(s,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis))
        ],
      ),
    );

List<BoxShadow> getShadowBox(Color upper, Color lower) => [
      BoxShadow(
        color: upper,
        offset: const Offset(4, 4),
        blurRadius: 15,
        spreadRadius: 5,
      ),
      BoxShadow(
        color: lower,
        offset: const Offset(-4, -4),
        blurRadius: 15,
        spreadRadius: 1,
      ),
    ];
