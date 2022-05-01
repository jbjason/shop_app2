import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class TotalAmountDetails extends StatelessWidget {
  const TotalAmountDetails(
      {Key? key,
      required this.finalAmount,
      required this.finalPoint,
      required this.finalVoucher,
      required this.width})
      : super(key: key);

  final double finalAmount, width;
  final int finalPoint;
  final double finalVoucher;

  @override
  Widget build(BuildContext context) {
    final subTotal = finalAmount.toStringAsFixed(2);
    final discount = (finalPoint + finalVoucher).toStringAsFixed(2);
    final grandTotal =
        (finalAmount - (finalPoint + finalVoucher)).toStringAsFixed(2);
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 15),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(children: [
              _totalText('Sub Total : \$ $subTotal \n\n', FontWeight.normal),
              _totalText('Discount : \$ $discount \n\n', FontWeight.normal),
              _totalText('Grand Total : \$ $grandTotal', FontWeight.bold),
            ]),
          ),
        ],
      ),
    );
  }

  TextSpan _totalText(String s, FontWeight fontWeight) {
    return TextSpan(
        text: s, style: TextStyle(color: AppColors.textDark, fontWeight: fontWeight));
  }
}
