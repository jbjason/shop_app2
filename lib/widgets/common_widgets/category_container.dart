import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/category.dart';

class CategoryContainer extends StatefulWidget {
  const CategoryContainer({Key? key, required this.tag}) : super(key: key);
  final String tag;
  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    final cat = Provider.of<Category>(context, listen: false);
    if (widget.tag.toLowerCase() == 'home') {
      cat.setCategoryList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final bool f = index == selectedIndex;
          return InkWell(
            onTap: () {
              setState(() => selectedIndex = index);
              final f = Provider.of<Category>(context, listen: false);
              if (widget.tag.toLowerCase() == 'home') {
                f.updateCategoryList(selectedIndex);
              } else {
                f.updateSortedList(selectedIndex);
              }
            },
            child: Container(
              child: Text(
                categories[index],
                style: TextStyle(color: f ? Colors.white : AppColors.textDark),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(
                  left: 3,
                  top: 5,
                  bottom: 5,
                  right: index == categories.length - 1 ? 10 : 5),
              decoration: BoxDecoration(
                  color: f
                      ? AppColors.accent.withOpacity(0.5)
                      : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10),
                    topLeft: f
                        ? const Radius.circular(40)
                        : const Radius.circular(10),
                    bottomRight: f
                        ? const Radius.circular(40)
                        : const Radius.circular(10),
                  ),
                  boxShadow: f
                      ? [
                          BoxShadow(
                            color: AppColors.accent.withOpacity(0.7),
                            offset: const Offset(2, 2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          )
                        ]
                      : []),
            ),
          );
        },
      ),
    );
  }
}
