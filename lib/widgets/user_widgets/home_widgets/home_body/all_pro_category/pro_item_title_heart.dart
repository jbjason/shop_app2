import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_others.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/common_widgets/heart_button.dart';

class ProItemTitleHeart extends StatelessWidget {
  const ProItemTitleHeart({Key? key, required this.product}) : super(key: key);
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
