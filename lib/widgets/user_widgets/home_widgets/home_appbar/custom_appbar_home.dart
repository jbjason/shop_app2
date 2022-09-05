import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/custom_body_home.dart';
import 'package:shop_app2/screens/users_screen/offers_screen.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({Key? key, required this.disappear}) : super(key: key);
  final double disappear;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disappear,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // body
          const CustomBodyHome(),
          // menu button // clipped area Button
          _seeTextButton(context),
        ],
      ),
    );
  }

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
