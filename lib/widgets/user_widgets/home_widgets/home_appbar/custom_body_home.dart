import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app2/constants/clippers_.dart';
import 'package:shop_app2/screens/users_screen/sort_by_screen.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/custom_appbar_home1.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/search_bar.dart';

class CustomBodyHome extends StatelessWidget {
  const CustomBodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: ClipPath(
        clipper: HomeClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _body(context),
          alignment: Alignment.center,
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

  Widget _body(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBarHome1(),
            Text('Hello Bazar!',
                style: GoogleFonts.permanentMarker(
                    textStyle:
                        const TextStyle(fontSize: 32, color: Colors.white))),
            const SizedBox(height: 10),
            const Text('   What do u like to buy ?',
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 5),
            Row(
              children: [
                const Expanded(child: SearchBar()),
                InkWell(
                  child: const Icon(Icons.settings_suggest_sharp,
                      size: 35, color: Colors.white),
                  onTap: () =>
                      Navigator.of(context).pushNamed(SortByScreen.routeName),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      );
}
