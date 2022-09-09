import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class SortByApplyButton extends StatelessWidget {
  const SortByApplyButton({Key? key, required this.onPress}) : super(key: key);
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 200,
        height: 40,
        margin: const EdgeInsets.only(top: 8),
        color: AppColors.accent,
        child: const Center(
            child: Text('Apply',
                style:
                    TextStyle(letterSpacing: 1.5, color: AppColors.textLigth))),
      ),
    );
  }
}
