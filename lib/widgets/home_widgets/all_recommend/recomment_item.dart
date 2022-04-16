import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/home_widgets/all_recommend/add_favorite_button.dart';

class RecommendItem extends StatelessWidget {
  RecommendItem({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      decoration: _decoration,
      child: Row(
        children: [
          // image
          _imageContainer(),
          // title ,price, review
          Expanded(
            child: Column(
              children: [
                _titlePriceContainer(),
                // favorite & cart Icons
                Expanded(child: AddFavoriteButtons(product: product)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: InkWell(
          onTap: () {},
          child: Hero(
            tag: product.id,
            child: FadeInImage(
              placeholder: const AssetImage('assets/placeholder.png'),
              image: NetworkImage(product.imageUrl[0]),
              width: 120.0,
              fit: BoxFit.contain,
            ),
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
    return Text(stars, style: const TextStyle(fontSize: 8));
  }

  final _decoration = BoxDecoration(
    borderRadius: const BorderRadius.only(
        topRight: Radius.circular(15),
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(50)),
    boxShadow: getShadowBox(Colors.grey.shade500, Colors.white),
  );
}