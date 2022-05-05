import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({Key? key, required this.submit}) : super(key: key);
  final void Function() submit;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => submit(),
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
        decoration: BoxDecoration(
          boxShadow: getShadowBox(Colors.grey[500]!, Colors.white),
          color: Colors.grey[300],
        ),
        alignment: Alignment.center,
        child: const Text(
          'Add Product',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              wordSpacing: 1.5),
        ),
      ),
    );
  }
}