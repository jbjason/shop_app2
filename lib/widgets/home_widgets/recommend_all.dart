import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/products.dart';

class RecommendAll extends StatelessWidget {
  const RecommendAll({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    final int length = products.length;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: length < 3 ? length * 140.0 : size.height * 0.6,
      width: size.width,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
        itemCount: length,
        itemBuilder: (context, index) =>
            RecommendItem(product: products[index]),
      ),
    );
  }
}

class RecommendItem extends StatelessWidget {
  const RecommendItem({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
              right: Radius.circular(40), left: Radius.circular(10))),
      child: Row(
        children: [
          // image
          ImageContainer(product: product),
          // title ,price, review
          Expanded(child: RightSideOfContainer(product: product)),
        ],
      ),
    );
  }
}

class RightSideOfContainer extends StatelessWidget {
  const RightSideOfContainer({Key? key, required this.product})
      : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
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
          // favorite & cart Icons
          AddAndFavoriteButtons(product: product),
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
}

class AddAndFavoriteButtons extends StatelessWidget {
  const AddAndFavoriteButtons({Key? key, required this.product})
      : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 20),
          onPressed: () => product.toggleFavoriteStatus(),
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart, size: 20),
          onPressed: () {
            cart.addItem(product);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                  content: Text('Added item to Cart!'),
                  duration: Duration(seconds: 1)));
          },
        ),
      ],
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: InkWell(
        onTap: () {},
        child: Hero(
          tag: product.id,
          child: FadeInImage(
            placeholder: const AssetImage('assets/placeholder.png'),
            image: NetworkImage(product.imageUrl),
            width: 120.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
