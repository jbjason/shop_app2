import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/details_body1.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/related_places.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // body
        DetailsBody1(product: product),
        const SizedBox(height: 25),
        _titlePortion('    Related Items'),
        const SizedBox(height: 10),
        RelatedPlaces(product: product),
      ],
    );
  }

  Widget _titlePortion(String s) =>
      Text(s, style: const TextStyle(fontSize: 18));
}
