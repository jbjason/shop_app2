import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_others.dart';

class DetailsColor extends StatelessWidget {
  const DetailsColor(
      {Key? key, required this.colors, required this.selectedColor})
      : super(key: key);
  final ValueNotifier<int> selectedColor;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10, bottom: 15),
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => selectedColor.value = index,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors[index],
            border: Border.all(
                width: 4,
                color: selectedColor.value == index
                    ? Colors.white
                    : Colors.transparent),
            boxShadow: getShadowBox(Colors.grey.shade300, Colors.white),
          ),
        ),
      ),
    );
  }
}
