import 'package:flutter/material.dart';

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

const String detailString =
    'Providers allow you to not only expose a value, but also create, listen, and dispose of it.\n\nTo expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.\n\nSee this StackOverflow answer which explains why using the .value constructor to create values is undesired.\nProviders allow you to not only expose a value, but also create, listen, and dispose of it.\n\nTo expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.\n\nSee this StackOverflow answer which explains why using the .value constructor to create values is undesired.';

List<String> sizeList = ['M', 'L', 'XL', 'XXL'];

List<Color> colorsList = [
  const Color(0xffe91e63),
  const Color(0xfff44336),
  const Color(0xff000000),
  const Color(0xff4caf50),
  const Color(0xff2196f3),
  const Color(0xff3f51b5)
];

const List<String> imageList = [
  'https://source.unsplash.com/random?sig=${5}',
  'https://source.unsplash.com/random?sig=${6}',
  'https://source.unsplash.com/random?sig=${7}',
  'https://source.unsplash.com/random?sig=${8}',
];
