import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app2/constants/theme.dart';

// This part is for WELCOME SCREEN
const String welcomeText3 =
    'looking for fresh products ? Try Hello Bazar. Everything you want find in a single app.';
const String detailString =
    'Providers allow you to not only expose a value, but also create, listen, and dispose of it.\n\nTo expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.\n\nSee this StackOverflow answer which explains why using the .value constructor to create values is undesired.\nProviders allow you to not only expose a value, but also create, listen, and dispose of it.\n\nTo expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.\n\nSee this StackOverflow answer which explains why using the .value constructor to create values is undesired.';
const String middleText2 =
    'There are vast variety collections of products of top Brands & Categories. As bangaldesh\'s online shopping landscape is expanding every year. ';
const String middleText3 =
    'Our assortment includes 100% original products from leading electronics, fashion, beauty, and lifestyle brands. Especially for shoppers who do not have debit cards or credit cards, Hello Bazar provides a facility of online shopping with cash on delivery to your home.';

// Auth Decoration
final authDecoration = BoxDecoration(
  gradient: LinearGradient(colors: [
    AppColors.secondary.withOpacity(0.5),
    AppColors.secondary.withOpacity(0.2),
    AppColors.secondary.withOpacity(0.1)
  ], begin: Alignment.bottomLeft, end: Alignment.topRight),
);
Widget welcomeText1() => RichText(
      text: TextSpan(
        children: [
          _spanText('Welcome to the world\'s most ', FontWeight.normal, 15,
              AppColors.textHighlight),
          _spanText('imaginative ', FontWeight.normal, 30, Colors.white),
          _spanText('marketPlace.\n\n\n', FontWeight.normal, 15,
              AppColors.textHighlight),
        ],
      ),
    );

Widget welcomeText1HighLight() => RichText(
    text: _spanText('"HELLO BAZAR"', FontWeight.bold, 42, AppColors.accent));

TextSpan _spanText(String s, FontWeight weight, double font, Color c) =>
    TextSpan(
      text: s,
      style: GoogleFonts.aclonica(
          textStyle: TextStyle(fontSize: font, color: c, wordSpacing: 3)),
    );

Widget swipeText(String s) => Text(s,
    textAlign: TextAlign.center,
    style: const TextStyle(
        fontSize: 11, color: AppColors.accent, fontWeight: FontWeight.w700));
