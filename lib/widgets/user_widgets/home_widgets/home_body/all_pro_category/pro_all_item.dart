import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_others.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/screens/users_screen/details_screen.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_pro_category/pro_item_title_heart.dart';

class ProAllItem extends StatelessWidget {
  const ProAllItem({Key? key, required this.product}) : super(key: key);
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
        tag: product.id + product.title,
        child: AnimatedContainer(
          duration: kThemeAnimationDuration,
          margin: const EdgeInsets.only(left: 8, right: 8, top: 10),
          child: ProItemTitleHeart(product: product),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(product.imageUrl[0]), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(40),
            boxShadow: getShadowBox(Colors.grey[300]!, Colors.white),
          ),
        ),
      );
}
