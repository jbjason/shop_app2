import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton(
      {Key? key,
      required this.isLoading,
      required this.submit,
      required this.isEdit})
      : super(key: key);
  final Function(BuildContext ctx) submit;
  final String isEdit;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => submit(context),
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          boxShadow: getShadowBox(Colors.grey[500]!, Colors.white),
          color: Colors.grey[300],
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Text(isEdit.isEmpty ? 'Add Product' : 'Update Product',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
