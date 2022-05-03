import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton(
      {Key? key, required this.width, required this.submitFunction})
      : super(key: key);
  final double width;
  final Function() submitFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: getButtonDecoration(
        70,
        width,
        BoxShape.rectangle,
        getShadowBox(Colors.grey.shade900, Colors.white),
        InkWell(
          onTap: () => submitFunction(),
          child: Container(
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text('Confirm Done!',
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
