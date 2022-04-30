import 'package:flutter/material.dart';
import 'package:shop_app2/screens/home_screen.dart';

class WelcomeBottomContainer extends StatelessWidget {
  const WelcomeBottomContainer({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final int isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // animated page counter
          _animatedPageList(),
          // continue button
          _continueButton(context),
        ],
      ),
    );
  }

  Widget _continueButton(BuildContext context) => InkWell(
        onTap: () => Navigator.of(context).pushNamed(HomeScreen.routeName),
        child: Row(
          children: const [
            Text('Continue ',
                style: TextStyle(fontSize: 16, color: Colors.white)),
            Icon(Icons.arrow_forward_outlined,
                color: Color.fromARGB(255, 5, 18, 43), size: 30)
          ],
        ),
      );

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
                    ? const Color(0xFF5c677d)
                    : const Color.fromARGB(255, 5, 18, 43),
              ),
            ),
          ),
        ),
      );
}
