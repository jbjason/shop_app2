// Welcome Screen part
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String welcomeText2 =
    'There are vast variety collections of products of top Brands & Categories. As bangaldesh\'s online shopping landscape is expanding every year. ';
const String welcomeText3 = 'Welcome to\n"Hello Bazar"';

Widget welcomeText1() => RichText(
      text: TextSpan(
        children: [
          _spanText('Welcome to the world\'s most ', FontWeight.normal, 35,
              Colors.white),
          _spanText('imaginative ', FontWeight.bold, 35,
              const Color.fromARGB(255, 5, 18, 43)),
          _spanText('marketPlace.\n', FontWeight.normal, 35, Colors.white),
          _spanText(
            'looking for fresh products ? Try Hello Bazar. Everything you want find in a single app.',
            FontWeight.normal,
            15,
            Colors.white,
          ),
        ],
      ),
    );

TextSpan _spanText(String s, FontWeight weight, double font, Color c) =>
    TextSpan(
      text: s,
      style: GoogleFonts.aclonica(
          textStyle: TextStyle(fontSize: font, color: c, wordSpacing: 3)),
    );

Widget swipeText(String s) =>
      Text(s, style: const TextStyle(fontSize: 13, color: Colors.black));