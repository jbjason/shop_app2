import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/screens/details_screen.dart';


class ProductItem extends StatelessWidget {
  ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

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
              image: NetworkImage(product.imageUrl[0]), fit: BoxFit.cover),
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
              Text('${product.isReview} review',
                  style: const TextStyle(fontSize: 11)),
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
