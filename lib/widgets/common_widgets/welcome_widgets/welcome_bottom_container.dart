import 'package:flutter/material.dart';
import 'package:shop_app2/screens/auth_and_admin/auth_screen.dart';
import 'package:shop_app2/screens/users_screen/home_screen.dart';

class WelcomeBottomContainer extends StatelessWidget {
  const WelcomeBottomContainer({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final int isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // animated page counter
          _animatedPageList(),
          const SizedBox(height: 10),
          // login & continue button
          _bottomButtons(context, isSelected),
        ],
      ),
    );
  }

  Widget _bottomButtons(BuildContext context, int index) => index == 2
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Login button
            InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(AuthScreen.routeName),
              child: Row(
                children: const [
                  Text('Login ',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  Icon(Icons.arrow_back_outlined, size: 30),
                ],
              ),
            ),
            // continue button
            InkWell(
              onTap: () =>
                  Navigator.of(context).pushNamed(HomeScreen.routeName),
              child: Row(
                children: const [
                  Text('Continue ',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  Icon(Icons.arrow_forward_outlined, size: 30)
                ],
              ),
            )
          ],
        )
      : Container();

  Widget _animatedPageList() => SizedBox(
        width: 100,
        child: Row(
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: kThemeAnimationDuration,
              margin: const EdgeInsets.only(right: 7),
              height: 13,
              width: isSelected == index ? 30 : 13,
              decoration: BoxDecoration(
                shape:
                    isSelected == index ? BoxShape.rectangle : BoxShape.circle,
                color: isSelected == index
                    ? Colors.white
                    : const Color(0xFF5c677d),
              ),
            ),
          ),
        ),
      );
}
