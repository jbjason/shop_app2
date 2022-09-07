import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app2/constants/constants_2.dart';
import 'package:shop_app2/constants/theme.dart';

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/s4.jpg'), fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          top: size.height * .7,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.4),
            ])),
            child: Text(
              welcomeText3,
              textAlign: TextAlign.center,
              style: GoogleFonts.aclonica(
                textStyle: const TextStyle(
                    fontSize: 30, color: AppColors.textHighlight),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
