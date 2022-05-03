import 'package:flutter/material.dart';

class RangeAmountText extends StatelessWidget {
  const RangeAmountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _rangeText('0', FontWeight.normal),
        _rangeText('1k', FontWeight.normal),
        _rangeText('2k', FontWeight.normal),
        _rangeText('3k', FontWeight.normal),
        _rangeText('4k', FontWeight.bold),
      ],
    );
  }

  Widget _rangeText(String s, FontWeight f) =>
      Text(s, style: TextStyle(fontWeight: f, fontSize: 11));
}
