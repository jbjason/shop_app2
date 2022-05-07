import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/screens/users_screen/details_screen.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_product/product_item1.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: _body(),
      onTap: () {
        Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: [
          product.id,
          MediaQuery.of(context).size.height.toString()
        ]);
      },
    );
  }

  Widget _body() => Hero(
        tag: product.id,
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 18),
          child: ProductItem1(product: product),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(product.imageUrl[0]), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(40),
            boxShadow: getShadowBox(Colors.grey.shade600, Colors.white),
          ),
        ),
      );
}
