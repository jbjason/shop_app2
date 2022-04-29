import 'package:flutter/material.dart';
import 'package:shop_app2/constants/clippers_.dart';
import 'package:shop_app2/widgets/home_widgets/home_appbar/search_bar.dart';

class CustomBodyHome extends StatelessWidget {
  const CustomBodyHome({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HomeClipper(),
      child: Container(
        height: height - 5,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: _body(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 103, 103, 180).withOpacity(0.5),
              const Color.fromARGB(255, 62, 62, 105).withOpacity(0.6),
              const Color.fromARGB(255, 45, 45, 75),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _body() => Padding(
        padding: const EdgeInsets.only(left: 25, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hii There !', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 20),
              const Text('What do u like to buy ?',
                  style: TextStyle(fontSize: 15)),
              Row(
                children: [
                  const Expanded(child: SearchBar()),
                  InkWell(
                    child: const Icon(Icons.settings_suggest_sharp,
                        size: 35, color: Colors.white),
                    onTap: () {},
                  ),
                  const SizedBox(width: 140),
                ],
              )
            ],
          ),
        ),
      );
}