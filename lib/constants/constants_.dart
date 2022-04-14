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
const String detailString =
    'Providers allow you to not only expose a value, but also create, listen, and dispose of it.\n\nTo expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.\n\nSee this StackOverflow answer which explains why using the .value constructor to create values is undesired.\nProviders allow you to not only expose a value, but also create, listen, and dispose of it.\n\nTo expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.\n\nSee this StackOverflow answer which explains why using the .value constructor to create values is undesired.';

const List<String> sizeList = ['M', 'L', 'XL', 'XXL'];

const List<Color> colorsList = [
  Colors.pink,
  Colors.red,
  Colors.black,
  Colors.green,
  Colors.blue,
  Colors.indigo
];

const List<String> imageList = [
  'https://source.unsplash.com/random?sig=${5}',
  'https://source.unsplash.com/random?sig=${6}',
  'https://source.unsplash.com/random?sig=${7}',
  'https://source.unsplash.com/random?sig=${8}',
];