import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/clippers_.dart';

class NavigationCBar extends StatelessWidget {
  const NavigationCBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NavPaniter(),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon:
                  const Icon(CupertinoIcons.chat_bubble, color: Colors.black87),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.square_split_2x2_fill,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
