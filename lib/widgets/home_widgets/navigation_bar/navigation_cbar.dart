import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/clippers_.dart';

class NavigationCBar extends StatelessWidget {
  const NavigationCBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NavClipper(),
      child: SizedBox(
        height: kToolbarHeight +5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black45),
                  child: const Icon(CupertinoIcons.chat_bubble,
                      color: Colors.white),
                ),
                const Text('Message')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black54),
                  child: const Icon(CupertinoIcons.square_split_2x2_fill,
                      color: Colors.white),
                ),
                const Text('Favorite')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
