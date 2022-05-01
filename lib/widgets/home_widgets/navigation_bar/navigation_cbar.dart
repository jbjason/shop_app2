import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/clippers_.dart';

class NavigationCBar extends StatelessWidget {
  const NavigationCBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NavClipper(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3)),
                  child: const Icon(CupertinoIcons.square_split_2x2_fill),
                ),
                const Text('All')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3)),
                  child: const Icon(CupertinoIcons.heart),
                ),
                const Text('Favorites')
              ],
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        height: kToolbarHeight + 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2, color: Colors.white60)),
      ),
    );
  }
}
