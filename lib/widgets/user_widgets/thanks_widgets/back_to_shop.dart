import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_others.dart';
import 'package:shop_app2/providers/cart.dart';

class BackToShopButton extends StatelessWidget {
  const BackToShopButton({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: getButtonDecoration(
        80,
        width,
        BoxShape.rectangle,
        getShadowBox(Colors.grey.shade600, Colors.white),
        InkWell(
          onTap: () {
            Provider.of<Cart>(context, listen: false).clear();
            int count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 3;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text('Back to Shopping !',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    wordSpacing: 1.5)),
          ),
        ),
      ),
    );
  }
}
