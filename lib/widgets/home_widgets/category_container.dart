import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

// ignore: must_be_immutable
class CategoryContainer extends StatefulWidget {
  const CategoryContainer({Key? key}) : super(key: key);
  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  final List<String> _category = [
    'All',
    'Electronics',
    'Sports',
    'Groceries',
    'Cloths'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _category.length,
        itemBuilder: (ctx, index) {
          final bool f = index == selectedIndex;
          return InkWell(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(
                  left: 3, right: index == _category.length - 1 ? 10 : 5),
              decoration: BoxDecoration(
                color:
                    f ? AppColors.accent.withOpacity(0.5) : Colors.transparent,
                borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(10),
                  bottomLeft: const Radius.circular(10),
                  topLeft: f ? const Radius.circular(40) : const Radius.circular(10),
                  bottomRight: f ? const Radius.circular(40) : const Radius.circular(10),
                ),
              ),
              child: Text(_category[index]),
            ),
          );
        },
      ),
    );
  }
}
