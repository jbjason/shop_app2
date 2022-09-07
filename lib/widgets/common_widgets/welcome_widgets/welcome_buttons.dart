import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/screens/auth_and_admin/auth_screen.dart';
import 'package:shop_app2/screens/users_screen/home_screen.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons(
      {Key? key, required this.currentIndex, required this.isLoading})
      : super(key: key);
  final bool isLoading;
  final int currentIndex;

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
          _bottomButtons(context, currentIndex),
        ],
      ),
    );
  }

  Widget _bottomButtons(BuildContext context, int index) => index == 1
      ? Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colors.white.withOpacity(0.8),
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.8),
              ])),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Login button
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(AuthScreen.routeName, arguments: 'admin'),
                      child: Row(
                        children: const [
                          Icon(Icons.arrow_back_outlined,
                              color: AppColors.textHighlight, size: 30),
                          Text(
                            'Admin ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.textHighlight),
                          ),
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
            2,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 7),
              height: 13,
              width: currentIndex == index ? 30 : 13,
              decoration: BoxDecoration(
                shape: currentIndex == index
                    ? BoxShape.rectangle
                    : BoxShape.circle,
                color:
                    currentIndex == index ? Colors.white : AppColors.secondary,
              ),
            ),
          ),
        ),
      );
}
