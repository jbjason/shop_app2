// Welcome Screen part
import 'package:flutter/material.dart';

const String middleText2 =
    'There are vast variety collections of products of top Brands & Categories. As bangaldesh\'s online shopping landscape is expanding every year. ';
const String middleText3 =
    'Our assortment includes 100% original products from leading electronics, fashion, beauty, and lifestyle brands. Especially for shoppers who do not have debit cards or credit cards, Hello Bazar provides a facility of online shopping with cash on delivery to your home.';

Widget middleLongText1() => RichText(
      text: TextSpan(
        children: [
          _spanText('Welcome to the world\'s most ', FontWeight.normal, 35,
              Colors.white),
          _spanText('imaginative ', FontWeight.bold, 30,
              const Color.fromARGB(255, 5, 18, 43)),
          _spanText('marketPlace.\n', FontWeight.normal, 35, Colors.white),
          _spanText(
            'looking for fresh products ? Try Hello Bazar. Everything you want find in a single app.',
            FontWeight.normal,
            13,
            Colors.white,
          ),
        ],
      ),
    );

TextSpan _spanText(String s, FontWeight weight, double font, Color c) =>
    TextSpan(
        text: s, style: TextStyle(fontSize: font, color: c, wordSpacing: 3));
