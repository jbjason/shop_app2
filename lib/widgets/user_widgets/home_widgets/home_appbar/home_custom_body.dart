import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app2/constants/clippers_.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/home_custom_buttons.dart';

class HomeCustomBody extends StatelessWidget {
  const HomeCustomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: ClipPath(
        clipper: HomeClipper(),
        child: Container(
          child: _body(context),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 62, 62, 105).withOpacity(0.6),
                const Color.fromARGB(255, 45, 45, 75),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              const HomeCustomButtons(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Text('Hello Bazar!',
                        style: GoogleFonts.permanentMarker(
                            textStyle: const TextStyle(
                                fontSize: 32, color: Colors.white))),
                    const SizedBox(height: 10),
                    const Text('What do u like to buy ?',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
