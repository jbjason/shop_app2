import 'package:flutter/material.dart';

class OrderedProductDetails extends StatelessWidget {
  const OrderedProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              children: const [
                SizedBox(width: 20),
                Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 12),
                Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}