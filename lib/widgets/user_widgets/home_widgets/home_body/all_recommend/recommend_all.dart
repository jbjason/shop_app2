import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_recommend/recomment_item.dart';

class RecommendAll extends StatelessWidget {
  const RecommendAll({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false).items;
    final int length = products.length;

    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 80),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => RecommendItem(
              product: products[length - 1 - index], subtitleKey: ''),
          childCount: length,
        ),
      ),
    );
  }
}
