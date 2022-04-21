import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';

class BackToShopButton extends StatelessWidget {
  const BackToShopButton({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: getButtonDecoration(
        70,
        width,
        BoxShape.rectangle,
        getShadowBox(Colors.grey.shade600, Colors.white),
        InkWell(
          onTap: () {},
          child: Container(
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