import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/products.dart';

class RecommendAll extends StatelessWidget {
  const RecommendAll({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    final int length = products.length;
    return  SizedBox(
        height: length < 3 ? length * 165.0 : size.height * 0.6,
        width: size.width,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 50),
          itemCount: products.length,
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
      height: 150,
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 15),
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
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(product.title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
            // Price
            Text(' \$${product.price}')
          ]),
          // reviews
          Row(children: [
            const Icon(Icons.location_on_sharp,
                size: 10.0, color: Colors.black),
            Text('${product.isReview} reviews'),
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
    return Text(stars);
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
          icon:
              Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: () => product.toggleFavoriteStatus(),
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.brown,
          ),
          onPressed: () {
            // cart.addItem(productId, price, imageUrl, title, keyId, quan);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: const Text('Added item to Cart!'),
                duration: const Duration(seconds: 1),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    // cart.removeSingleItem(product.id);
                  },
                ),
              ));
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
