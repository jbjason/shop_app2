import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/clippers_.dart';
import 'package:shop_app2/constants/constants_others.dart';

class NavigationCBar extends StatelessWidget {
  const NavigationCBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NavClipper(),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                buttonBackGround(const Icon(
                    CupertinoIcons.square_split_2x2_fill,
                    color: Colors.white)),
                const SizedBox(width: 6),
                const Text('All pro.', style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(width: 1),
            Row(
              children: [
                const Text('Favorites', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 6),
                buttonBackGround(const Icon(CupertinoIcons.heart_slash_fill,
                    color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
