import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/screens/users_screen/offers_screen.dart';

class CustomAppBarHome1 extends StatelessWidget {
  const CustomAppBarHome1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _topButtons(context),
        _seeTextButton(context),
      ],
    );
  }

  Widget _topButtons(BuildContext context) => Positioned(
        top: 40,
        left: 6,
        right: 9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // drawer open button
            InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(Icons.read_more_sharp, color: Colors.white)),
            const Icon(Icons.more_vert, color: Colors.white)
          ],
        ),
      );

  Widget _seeTextButton(BuildContext context) => Positioned(
        bottom: 10,
        right: 30,
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(OffersScreen.routeName),
          child: const Text(
            'See All',
            style:
                TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
