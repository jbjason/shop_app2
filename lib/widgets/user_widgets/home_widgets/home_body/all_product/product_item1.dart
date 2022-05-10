import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/common_widgets/extra_/heart_button.dart';

class ProductItem1 extends StatelessWidget {
  const ProductItem1({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _heartButton(),
        _title(),
      ],
    );
  }

  Widget _heartButton() => Positioned(
        top: 10,
        right: 8,
        child: buttonBackGround(HeartButton(product: product)),
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
