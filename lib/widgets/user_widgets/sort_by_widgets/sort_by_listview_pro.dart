import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_recommend/recomment_item.dart';

class SortByListViewPro extends StatelessWidget {
  const SortByListViewPro({Key? key, required List<Product> suggestions})
      : _suggestions = suggestions,
        super(key: key);

  final List<Product> _suggestions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: _suggestions.length,
        itemBuilder: ((context, index) => RecommendItem(
            product: _suggestions[index], subtitleKey: 'subtitle')),
      ),
    );
  }
}
