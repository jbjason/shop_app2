import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/home_widgets/home_body/all_recommend/recomment_item.dart';

class RecommendAll extends StatelessWidget {
  const RecommendAll({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false).items;
    final int length = products.length;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: length < 3 ? length * 120.0 : size.height * 0.5,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('  Recommended', style: TextStyle(fontSize: 22)),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 50, top: 10),
                itemCount: length,
                itemBuilder: (context, index) =>
                    RecommendItem(product: products[length - 1 - index])),
          ),
        ],
      ),
    );
  }
}
