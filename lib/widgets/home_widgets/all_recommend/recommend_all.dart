import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/home_widgets/all_recommend/recomment_item.dart';

class RecommendAll extends StatelessWidget {
  const RecommendAll({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false).items;
    final int length = products.length;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: length < 3 ? length * 118.0 : size.height * 0.5,
      width: size.width,
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          itemCount: length * 3,
          itemBuilder: (context, index) =>
              RecommendItem(product: products[index % 4])),
    );
  }
}