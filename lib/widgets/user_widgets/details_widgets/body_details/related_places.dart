import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';

class RelatedPlaces extends StatelessWidget {
  const RelatedPlaces({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SizedBox(
        height: 180,
        child: ListView.builder(
          itemCount: product.imageUrl.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 150,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.imageUrl[product.imageUrl.length - 1 - index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
