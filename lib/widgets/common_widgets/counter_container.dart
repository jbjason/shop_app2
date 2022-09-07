import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class CounterContainer extends StatelessWidget {
  const CounterContainer(
      {Key? key, required this.currentIndex, required this.length})
      : super(key: key);
  final int length, currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: List.generate(
          length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(right: 7),
            height: 13,
            width: currentIndex == index ? 30 : 13,
            decoration: BoxDecoration(
              shape:
                  currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
              color: currentIndex == index ? Colors.white : AppColors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
