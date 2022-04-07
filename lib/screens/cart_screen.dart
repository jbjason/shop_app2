import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';

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

class CartTotalAmount extends StatelessWidget {
  const CartTotalAmount({
    Key? key,
    required this.cartItems,
  }) : super(key: key);

  final Cart cartItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(left: 17, right: 17),
      padding: const EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFFEBF3FE),
          border: Border.all(
              width: 3,
              color: const Color(0xFF3F6080).withOpacity(.2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Total : ',
              style: GoogleFonts.kaushanScript(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.3,
                      color: Colors.black)),
              children: [TextSpan(text: '${cartItems.totalAmount}')],
            ),
          ),
          const Text('Confirm Orders'),
          // TextButton(
          //     onPressed: () {}, child: const Text('Confirm Orders'))
        ],
      ),
    );
  }
}


class CartSingleItem extends StatelessWidget {
  CartSingleItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final CartItem item;
  final int index;
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      height: 80,
      decoration: _decoration,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(item.imageUrl),
          ),
        ),
        title: Text(item.title),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(item.price.toString()),
            const SizedBox(height: 5),
            SizedBox(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        if (item.quantity != 1) {
                          cartData.update(item, 'm');
                        }
                      },
                      child: const Icon(CupertinoIcons.minus_circle, size: 20)),
                  Text('${item.quantity < 10 ? 0 : ''}${item.quantity}'),
                  InkWell(
                      onTap: () => cartData.update(item, 'plus'),
                      child: const Icon(CupertinoIcons.plus_circle, size: 20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final _decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.vertical(
        top: Radius.circular(35), bottom: Radius.circular(14)),
    boxShadow: [
      BoxShadow(
          color: const Color(0xFF3F6080).withOpacity(.2),
          offset: const Offset(4.0, 4.0),
          blurRadius: 15.0,
          spreadRadius: 3.0),
      const BoxShadow(
          color: Color(0xFFEBF3FE),
          offset: Offset(-4.0, -4.0),
          blurRadius: 15.0,
          spreadRadius: 1.0),
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF3F6080).withOpacity(.2),
        const Color(0xFFEBF3FE).withOpacity(0.4),
        const Color(0xFFEBF3FE).withOpacity(0.6),
        const Color(0xFFEBF3FE).withOpacity(0.8),
      ],
      stops: const [0.1, 0.3, 0.4, 1],
    ),
  );
}
