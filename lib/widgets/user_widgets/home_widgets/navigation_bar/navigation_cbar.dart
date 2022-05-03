import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/clippers_.dart';
import 'package:shop_app2/constants/constants_.dart';

class NavigationCBar extends StatelessWidget {
  const NavigationCBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, bottom: 10),
      child: CustomPaint(
        painter: NavClipper(),
        child: Container(
          height: kToolbarHeight + 7,
          decoration:
              BoxDecoration(border: Border.all(width: 3, color: Colors.white)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buttonBackGround(
                      const Icon(CupertinoIcons.square_split_2x2_fill)),
                  const Text('All')
                ],
              ),
              Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonBackGround(const Icon(CupertinoIcons.heart)),
                  const Text('Favorites')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
