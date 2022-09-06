import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/providers/product.dart';
import 'dart:math' as math;
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_product/product_item.dart';

class ProductAll extends StatefulWidget {
  const ProductAll({Key? key}) : super(key: key);
  @override
  State<ProductAll> createState() => _ProductAllState();
}

class _ProductAllState extends State<ProductAll> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.77, initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final products = Provider.of<Category>(context).categoryList;
    return SizedBox(
      height: size.height * .3,
      child: PageView.builder(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        onPageChanged: (value) => setState(() => _currentIndex = value),
        itemCount: products.length,
        itemBuilder: (context, index) => _buildSlider(products[index], index),
      ),
    );
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
            opacity: _currentIndex == i ? 1 : 0.5,
            child: Transform.rotate(
              angle: math.pi * value,
              child: ProductItem(product: product),
            ),
          );
        },
      );
}
