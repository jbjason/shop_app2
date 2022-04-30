import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/product.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(
      {Key? key,
      required this.product,
      required this.selectedColor,
      required this.selectedSize})
      : super(key: key);
  final Product product;
  final int selectedColor, selectedSize;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        child: Container(
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              boxShadow: getShadowBox(Colors.grey[600]!, Colors.white)),
          alignment: Alignment.center,
          child: const Text('ADD TO CART',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  wordSpacing: 1.5)),
        ),
        onTap: () {
          final s = Provider.of<Cart>(context, listen: false)
              .addItem(product, selectedColor, selectedSize);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text(s), duration: const Duration(seconds: 1)));
        },
      ),
    );
  }
}