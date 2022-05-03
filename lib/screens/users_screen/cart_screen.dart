import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/widgets/user_widgets/cart_widgets/cart_single_item.dart';
import 'package:shop_app2/widgets/user_widgets/cart_widgets/cart_total_amount.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              getAppBarTile('Your Cart', context),
              Expanded(child: _cartList(cartItems.items)),
              CartTotalAmount(cartItems: cartItems),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartList(List<CartItem> cartItems) {
    return cartItems.isNotEmpty
        ? ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: ((context, i) =>
                CartSingleItem(item: cartItems[i], index: i)),
          )
        : const Center(
            child: Text('No items Available right now !'),
          );
  }
}
