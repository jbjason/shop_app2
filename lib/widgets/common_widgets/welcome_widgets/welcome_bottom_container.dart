import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/screens/auth_and_admin/admin_panel_screen.dart';
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
      ? Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.5),
          ])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Login button
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(AdminPanelScreen.routeName),
                child: Row(
                  children:  const [
                    Icon(Icons.arrow_back_outlined, size: 30),
                    Text('Login ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.textHighlight)),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.textHighlight)),
                    Icon(Icons.arrow_forward_outlined, size: 30)
                  ],
                ),
              )
            ],
          ),
        )
      : Container();

  Widget _animatedPageList() => SizedBox(
        width: 100,
        child: Row(
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 7),
              height: 13,
              width: isSelected == index ? 30 : 13,
              decoration: BoxDecoration(
                shape:
                    isSelected == index ? BoxShape.rectangle : BoxShape.circle,
                color: isSelected == index
                    ? Colors.white
                    : AppColors.secondary ,
              ),
            ),
          ),
        ),
      );
}
