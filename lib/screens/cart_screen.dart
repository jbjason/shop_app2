import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/widgets/cart_widgets/cart_single_item.dart';
import 'package:shop_app2/widgets/cart_widgets/cart_total_amount.dart';

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
              _backButtonTitle(context),
              Expanded(child: _cartList(cartItems.items)),
              CartTotalAmount(cartItems: cartItems),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButtonTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 60,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 10),
          const Text('Your Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
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
