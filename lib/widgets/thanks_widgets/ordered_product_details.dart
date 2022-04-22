import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';

class OrderedProductDetails extends StatelessWidget {
  const OrderedProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Cart>(context, listen: false).items;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            _titleTexts(),
            const SizedBox(height: 10),
           
          ],
        ),
      ),
    );
  }

  Widget _titleTexts() => Row(
        children: const [
          SizedBox(width: 20),
          Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
          Spacer(),
          Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(width: 12),
          Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );
}
