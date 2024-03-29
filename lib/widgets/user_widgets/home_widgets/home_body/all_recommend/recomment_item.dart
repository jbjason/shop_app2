import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_others.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/screens/users_screen/details_screen.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_recommend/favorite_button.dart';

class RecommendItem extends StatelessWidget {
  RecommendItem({Key? key, required this.product, required this.subtitleKey})
      : super(key: key);
  final Product product;
  final String subtitleKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: _decoration,
      child: Row(
        children: [
          // image
          _imageContainer(context),
          // title ,price, review
          Expanded(
            child: Column(
              children: [
                _titlePriceContainer(),
                // favorite & cart Icons
                const SizedBox(height: 10),
                Expanded(child: FavoriteButtons(product: product)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(DetailsScreen.routeName,
                arguments: [
                  product.id,
                  MediaQuery.of(context).size.height.toString()
                ]);
          },
          child: FadeInImage(
            placeholder: const AssetImage('assets/placeholder.png'),
            image: NetworkImage(product.imageUrl[0]),
            width: 120.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _titlePriceContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              product.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            // Price
            Text(' \$${product.price}')
          ]),
          // reviews
          Row(children: [
            const Icon(Icons.location_on_sharp, size: 10.0),
            Text('${product.isReview} reviews',
                style: const TextStyle(fontSize: 11)),
            const Spacer(),
            //bangla Subtitle
            subtitleKey == 'subtitle'
                ? Text(product.subtitle)
                : const SizedBox(),
          ]),
          // ratings
          _buildRatingStars(product.isRating.toInt()),
        ],
      ),
    );
  }

  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars, style: const TextStyle(fontSize: 5));
  }

  final _decoration = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: const BorderRadius.only(
        topRight: Radius.circular(15),
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(50)),
    boxShadow: getShadowBox(Colors.grey[300]!, Colors.white),
  );
}
