import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/screens/auth_screen.dart';
import 'package:shop_app2/screens/users_screen/confirm_screen.dart';

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
      margin: const EdgeInsets.only(left: 14, right: 14),
      padding: const EdgeInsets.only(left: 20, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFFEBF3FE),
          border: Border.all(
              width: 3, color: const Color(0xFF3F6080).withOpacity(.2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _totalTextAndAmount(),
          _confirmOrdersText(context),
        ],
      ),
    );
  }

  Widget _totalTextAndAmount() {
    return RichText(
      text: TextSpan(
        text: 'Total : ',
        style: GoogleFonts.kaushanScript(
            textStyle: const TextStyle(
                fontSize: 18, letterSpacing: 1.3, color: Colors.black)),
        children: [TextSpan(text: cartItems.totalAmount.toStringAsFixed(2))],
      ),
    );
  }

  Widget _confirmOrdersText(BuildContext context) {
    return TextButton(
      onPressed: () {
        final _user = Provider.of<Category>(context, listen: false).userid;
        if (_user.isEmpty) {
          Navigator.of(context)
              .pushNamed(AuthScreen.routeName, arguments: 'cart');
        } else {
          Navigator.of(context).pushNamed(ConfirmScreen.routeName);
        }
      },
      child: const Text('Confirm Orders'),
    );
  }
}
