import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/common_widgets/category_container.dart';
import 'dart:math' as math;
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_pro_category/pro_all_item.dart';

class CategoryProductAll extends StatefulWidget {
  const CategoryProductAll({Key? key}) : super(key: key);
  @override
  State<CategoryProductAll> createState() => _CategoryProductAllState();
}

class _CategoryProductAllState extends State<CategoryProductAll> {
  final _currentIndex = ValueNotifier<int>(0);
  late PageController _pageController;
  final _currentCategory = ValueNotifier<String>('All');

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.68, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final products = Provider.of<Category>(context).allProducts;
    return Column(
      children: [
        CategoryContainer(selectedCategory: _onCategorySelect),
        SizedBox(
          height: size.height * .23,
          child: PageView.builder(
            controller: _pageController,
            clipBehavior: Clip.none,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) => _currentIndex.value = value,
            itemCount: products.length,
            itemBuilder: (context, index) =>
                _buildSlider(products[index], index),
          ),
        )
      ],
    );
  }

  void _onCategorySelect(String s) {
    _currentCategory.value = s;
    Provider.of<Category>(context, listen: false)
        .setAllProducts(_currentCategory.value);
  }

  Widget _buildSlider(Product product, int i) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = i - _pageController.page!;
            value = (value * 0.05).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: _currentIndex.value == i ? 1 : 0.5,
            child: Transform.rotate(
              angle: math.pi * value,
              child: ProAllItem(product: product),
            ),
          );
        },
      );

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
