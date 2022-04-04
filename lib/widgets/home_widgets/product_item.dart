import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // title ,price, review
        RightSideOfContainer(product: product),
        // image
        ImageContainer(product: product),
      ],
    );
  }
}

class RightSideOfContainer extends StatelessWidget {
  const RightSideOfContainer({Key? key, required this.product})
      : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 2.0),
        padding: const EdgeInsets.fromLTRB(100.0, 5.0, 5.0, 0.0),
        height: 180.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            SizedBox(
              width: 120.0,
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            // reviews
            Row(
              children: [
                const Icon(
                  Icons.location_on_sharp,
                  size: 10.0,
                  color: Colors.black,
                ),
                const SizedBox(width: 5.0),
                Text('${product.isReview} reviews'),
              ],
            ),
            // ratings
            _buildRatingStars(product.isRating.toInt()),
            const SizedBox(height: 5),
            // Price
            Text(' \$${product.price}'),
            // favorite & cart Icons
            AddAndFavoriteButtons(product: product),
          ],
        ),
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
                    cart.removeSingleItem(product.id);
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
    return Positioned(
      left: 20.0,
      top: 15.0,
      bottom: 15.0,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: InkWell(
            onTap: () {},
            child: Hero(
              tag: product.id,
              child: FadeInImage(
                placeholder: const AssetImage('assets/placeholder.png'),
                image: NetworkImage(product.imageUrl),
                width: 110.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
