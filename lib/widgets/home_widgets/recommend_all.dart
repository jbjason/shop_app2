import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
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
      height: length < 3 ? length * 118.0 : size.height * 0.5,
      width: size.width,
      child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          itemCount: length,
          itemBuilder: (context, index) =>
              RecommendItem(product: products[index])),
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
                Expanded(child: AddAndFavoriteButtons(product: product)),
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

class AddAndFavoriteButtons extends StatefulWidget {
  const AddAndFavoriteButtons({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  State<AddAndFavoriteButtons> createState() => _AddAndFavoriteButtonsState();
}

class _AddAndFavoriteButtonsState extends State<AddAndFavoriteButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 80),
      decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.4),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
                widget.product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 20),
            onPressed: () {
              widget.product.toggleFavoriteStatus();
              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.cart, size: 20),
            onPressed: () {
              Provider.of<Cart>(context, listen: false).addItem(widget.product,
                  widget.product.color[0], widget.product.size[0]);
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
