import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/screens/cart_screen.dart';
import 'package:shop_app2/widgets/home_widgets/navigation_bar/badge.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (_, cart, ch) {
        final f = cart.itemCount;
        return Badge(
            child: ch!,
            value: f.toString(),
            color: f != 0 ? const Color(0xFFfaedcd) : Colors.transparent);
      },
      child: getButtonDecoration(
        70,
        70,
        BoxShape.circle,
        [],
        FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(CartScreen.routeName),
          child: const Icon(CupertinoIcons.shopping_cart),
        ),
      ),
    );
  }
}