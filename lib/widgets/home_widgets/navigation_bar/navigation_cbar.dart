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
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black87,
                ),
                Text('Message   ')
              ],
            ),
            Column(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  CupertinoIcons.square_split_2x2_fill,
                  color: Colors.black87,
                ),
                Text('    Favorite')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
