import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/screens/details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: _body(),
      onTap: () {
        Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: [
          product.id,
          MediaQuery.of(context).size.height.toString()
        ]);
      },
    );
  }

  Widget _body() => Hero(
        tag: product.id,
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 18),
          child: Stack(
            children: [
              _ratings(),
              _reveiws(),
              _title(),
            ],
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(product.imageUrl[0]), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(colors: [
              Color(0xFFeae4e9),
              Color(0xFFfff1e6),
              Color(0xFFf0efeb),
              Color(0xFFf0efeb),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            boxShadow: getShadowBox(Colors.grey.shade600, Colors.white),
          ),
        ),
      );

  Widget _ratings() => Positioned(
        top: 10,
        left: 5,
        child: Container(
          height: 37,
          width: 37,
          alignment: Alignment.center,
          child: Text('⭐${product.isRating.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 11, color: Colors.black)),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5), shape: BoxShape.circle),
        ),
      );
  Widget _reveiws() => Positioned(
        top: 10,
        right: 8,
        child: Container(
          height: 33,
          width: 33,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_sharp, size: 10.0),
              Text('${product.isReview}',
                  style: const TextStyle(fontSize: 11, color: Colors.black)),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
        ),
      );
  Widget _title() => Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          width: 200,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
            gradient: LinearGradient(colors: [
              Colors.white.withOpacity(0.45),
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0.2),
            ]),
          ),
          child: Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      );
}
