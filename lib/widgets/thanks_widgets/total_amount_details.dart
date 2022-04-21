import 'package:flutter/material.dart';

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
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 15),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(children: [
              _totalText('Sub Total : \$ $finalAmount \n\n', FontWeight.normal),
              _totalText('Discount : \$ ${finalPoint + finalVoucher} \n\n',
                  FontWeight.normal),
              _totalText(
                  'Grand Total : \$ ${finalAmount - (finalPoint + finalVoucher)}',
                  FontWeight.bold),
            ]),
          ),
        ],
      ),
    );
  }

  TextSpan _totalText(String s, FontWeight fontWeight) {
    return TextSpan(
        text: s, style: TextStyle(color: Colors.black, fontWeight: fontWeight));
  }
}