import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String detailString =
    'Providers allow you to not only expose a value, but also create, listen, and dispose of it.\n\nTo expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.\n\nSee this StackOverflow answer which explains why using the .value constructor to create values is undesired.\nProviders allow you to not only expose a value, but also create, listen, and dispose of it.\n\nTo expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.\n\nSee this StackOverflow answer which explains why using the .value constructor to create values is undesired.';

const String middleText2 =
    'There are vast variety collections of products of top Brands & Categories. As bangaldesh\'s online shopping landscape is expanding every year. ';

const String middleText3 =
    'Our assortment includes 100% original products from leading electronics, fashion, beauty, and lifestyle brands. Especially for shoppers who do not have debit cards or credit cards, Hello Bazar provides a facility of online shopping with cash on delivery to your home.';

List<String> sizeList = ['M', 'L', 'XL', 'XXL'];

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
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
        ],
      ),
    );

List<Color> colorsList = [
  const Color(0xffe91e63),
  const Color(0xfff44336),
  const Color(0xff000000),
  const Color(0xff4caf50),
  const Color(0xff2196f3),
  const Color(0xff3f51b5)
];

final List<String> categories = [
  'All',
  'Electronics',
  'Sports',
  'Groceries',
  'Cloths'
];
const List<String> imageList1 = [
  'https://source.unsplash.com/random?sig=${1}',
  'https://source.unsplash.com/random?sig=${2}',
  'https://source.unsplash.com/random?sig=${3}',
  'https://source.unsplash.com/random?sig=${4}',
];
const List<String> imageList2 = [
  'https://source.unsplash.com/random?sig=${5}',
  'https://source.unsplash.com/random?sig=${6}',
  'https://source.unsplash.com/random?sig=${7}',
  'https://source.unsplash.com/random?sig=${8}',
];
const List<String> imageList3 = [
  'https://source.unsplash.com/random?sig=${9}',
  'https://source.unsplash.com/random?sig=${10}',
  'https://source.unsplash.com/random?sig=${11}',
  'https://source.unsplash.com/random?sig=${12}',
];
const List<String> imageList4 = [
  'https://source.unsplash.com/random?sig=${13}',
  'https://source.unsplash.com/random?sig=${14}',
  'https://source.unsplash.com/random?sig=${15}',
  'https://source.unsplash.com/random?sig=${16}',
];
