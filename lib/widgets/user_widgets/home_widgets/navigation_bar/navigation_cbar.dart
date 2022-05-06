import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/clippers_.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/theme.dart';

class NavigationCBar extends StatelessWidget {
  const NavigationCBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: CustomPaint(
        painter: NavClipper(),
        child: SizedBox(
          height: kToolbarHeight + 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navButtons(CupertinoIcons.square_split_2x2_fill, 'All pro.'),
              _navButtons(CupertinoIcons.heart_slash_fill, 'Favorites'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButtons(IconData _icon, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buttonBackGround(Icon(_icon, color: AppColors.secondary)),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.7),
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          alignment: Alignment.bottomCenter,
          child: Text(title,
              style: const TextStyle(fontSize: 11, color: Colors.white)),
        )
      ],
    );
  }
}
