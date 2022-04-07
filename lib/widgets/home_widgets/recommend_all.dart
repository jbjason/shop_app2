import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/products.dart';

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
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 70),
        itemCount: length,
        itemBuilder: (context, index) =>
            RecommendItem(product: products[index]),
      ),
    );
  }
}

class RecommendItem extends StatelessWidget {
  RecommendItem({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      decoration: _decoration,
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

  final _decoration = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: const BorderRadius.only(
        topRight: Radius.circular(15),
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(50)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade500,
        offset: const Offset(4, 4),
        blurRadius: 15,
        spreadRadius: 3,
      ),
      const BoxShadow(
        color: Colors.white,
        offset: Offset(-4, -4),
        blurRadius: 15,
        spreadRadius: 1,
      ),
    ],
  );
}

class RightSideOfContainer extends StatelessWidget {
  const RightSideOfContainer({Key? key, required this.product})
      : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _titlePriceContainer(),
        // favorite & cart Icons
        Expanded(child: AddAndFavoriteButtons(product: product)),
      ],
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
}

class AddAndFavoriteButtons extends StatelessWidget {
  const AddAndFavoriteButtons({Key? key, required this.product})
      : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 80),
      decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(40))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 15),
            onPressed: () => product.toggleFavoriteStatus(),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, size: 15),
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
      ),
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
              image: NetworkImage(product.imageUrl),
              width: 120.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
