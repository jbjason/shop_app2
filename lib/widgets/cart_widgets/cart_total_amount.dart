import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/orders.dart';
import 'package:shop_app2/screens/order_screen.dart';

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
              width: 3, color: const Color(0xFF3F6080).withOpacity(.2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Total : ',
              style: GoogleFonts.kaushanScript(
                  textStyle: const TextStyle(
                      fontSize: 18, letterSpacing: 1.3, color: Colors.black)),
              children: [
                TextSpan(text: cartItems.totalAmount.toStringAsFixed(2))
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Provider.of<Orders>(context, listen: false)
                    .addOrder(cartItems.items, cartItems.totalAmount);
                cartItems.clear();
                Navigator.of(context).pushNamed(OrderScreen.routeName);
              },
              child: const Text('Confirm Orders')),
        ],
      ),
    );
  }
}
