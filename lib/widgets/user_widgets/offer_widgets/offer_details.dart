import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_2.dart';
import 'package:shop_app2/providers/product.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails(
      {Key? key,
      required this.rotation,
      required this.index,
      required this.product,
      required this.height})
      : super(key: key);
  final Product product;
  final double rotation, height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1 - rotation,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.5),
        ),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(10.0), child: Text(detailString)),
              ),
            ),
            _offerDetailsTexts(),
          ],
        ),
      ),
    );
  }

  Widget _offerDetailsTexts() => Container(
        color: Colors.white,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            swipeText('↞swipe'),
            Container(
              margin: const EdgeInsets.only(top: 7),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: const Text(
                'Due: 21.05.2022,Sunday',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            swipeText('swipe↠'),
          ],
        ),
      );
}
