import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/providers/products.dart';
import 'dart:math' as math;
import 'package:shop_app2/screens/details_screen.dart';

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
    final products = Provider.of<Products>(context).items;
    return SizedBox(
      height: size.height * .42,
      child: PageView.builder(
        controller: _pageController,
        physics: const ClampingScrollPhysics(),
        onPageChanged: (value) => setState(() => _currentIndex = value),
        itemCount: products.length,
        itemBuilder: (context, index) =>
            buildMovieSlider(products[index], index),
      ),
    );
  }

  Widget buildMovieSlider(Product product, int i) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = i - _pageController.page!;
            // We use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
            // we use clamp so that our value vary from -1 to 1
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: _currentIndex == i ? 1 : 0.5,
            child: Transform.rotate(
              angle: math.pi * value,
              child: ProductItem(product: product, currentIndex: i),
            ),
          );
        },
      );
}

class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.product, required this.currentIndex})
      : super(key: key);
  final Product product;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 18),
      padding: const EdgeInsets.all(10),
      decoration: _decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: _imageContainer(context)),
          const SizedBox(height: 7),
          _titleAndPrice(),
          _reviewsRatingsFavorite(),
        ],
      ),
    );
  }

  Widget _imageContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: [
          MediaQuery.of(context).size.height.toString(),
          product.id,
        ]);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: NetworkImage(imageList[currentIndex]), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _titleAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        product.title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _reviewsRatingsFavorite() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('⭐ ${product.isRating}', style: const TextStyle(fontSize: 11)),
          const SizedBox(width: 6),
          Row(
            children: [
              const Icon(Icons.location_on_sharp, size: 10.0),
              Text('${product.isReview} review', style: const TextStyle(fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }

  final _decoration = BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(40),
      gradient: const LinearGradient(colors: [
        Color(0xFFeae4e9),
        Color(0xFFfff1e6),
        Color(0xFFf0efeb),
        Color(0xFFf0efeb),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      boxShadow: getShadowBox(Colors.grey.shade600, Colors.white));
}
