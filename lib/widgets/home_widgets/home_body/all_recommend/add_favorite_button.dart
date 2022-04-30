import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/product.dart';

class AddButtons extends StatefulWidget {
  const AddButtons({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<AddButtons> createState() => _AddButtonsState();
}

class _AddButtonsState extends State<AddButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 80),
      decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.4),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
                widget.product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 20),
            onPressed: () {
              widget.product.toggleFavoriteStatus();
              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.cart, size: 20),
            onPressed: () {
              final s = Provider.of<Cart>(context, listen: false)
                  .addItem(widget.product, 0, 0);
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text(s), duration: const Duration(seconds: 1)));
            },
          ),
        ],
      ),
    );
  }
}
