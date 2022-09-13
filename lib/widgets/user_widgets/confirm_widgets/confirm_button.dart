import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_others.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton(
      {Key? key,
      required this.width,
      required this.submitFunction,
      required this.isLoading})
      : super(key: key);
  final bool isLoading;
  final double width;
  final Function() submitFunction;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => submitFunction(),
        child: !isLoading
            ? Container(
                width: width,
                height: 80,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  boxShadow: getShadowBox(Colors.grey[500]!, Colors.white),
                  color: Colors.grey[300],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Confirm Done!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      wordSpacing: 1.5),
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
