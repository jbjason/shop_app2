import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/heart_button.dart';

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
            _title(),
            // rating ,review , price
            _priceRating(),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(50)),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.6),
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.niconne(
              textStyle: TextStyle(
                fontSize: lerpDouble(20, 40, topPercent),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          HeartButton(product: product),
        ],
      );

  Widget _priceRating() => Row(
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
          Text('\$ ${product.price}',
              style: const TextStyle(color: Colors.black)),
        ],
      );
}
