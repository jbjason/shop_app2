import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/common_widgets/extra_/heart_button.dart';

class FavoriteButtons extends StatelessWidget {
  const FavoriteButtons({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 80),
      decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HeartButton(product: product),
          _cartButton(context),
        ],
      ),
    );
  }

  Widget _cartButton(BuildContext context) => InkWell(
      onTap: () {
        final s =
            Provider.of<Cart>(context, listen: false).addItem(product, 0, 0);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
              SnackBar(content: Text(s), duration: const Duration(seconds: 1)));
      },
      child: buttonBackGround(const Icon(CupertinoIcons.cart_fill)));
}
