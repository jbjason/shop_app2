import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';

class TitleSplashContainer extends StatelessWidget {
  const TitleSplashContainer({
    Key? key,
    required this.topPercent,
    required this.product,
  }) : super(key: key);
  final double topPercent;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: null,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: lerpDouble(20, 40, topPercent),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(CupertinoIcons.heart,color: Colors.black),
              ],
            ),
            // rating ,review , price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_sharp, size: 14),
                    Text(
                      '${product.isReview} reviews',
                      style: const TextStyle(fontSize: 11),
                    ),
                    const SizedBox(width: 10),
                    const Text('✶', style: TextStyle(fontSize: 18)),
                    Text(
                      product.isRating.toString(),
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.7),
              Colors.white.withOpacity(0.6),
              Colors.white.withOpacity(0.3),
            ],
          ),
        ),
      ),
    );
  }
}