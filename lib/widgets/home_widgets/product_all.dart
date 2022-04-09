import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products.dart';

class ProductAll extends StatefulWidget {
  const ProductAll({Key? key}) : super(key: key);
  @override
  State<ProductAll> createState() => _ProductAllState();
}

class _ProductAllState extends State<ProductAll> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .42,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8, initialPage: 1),
        onPageChanged: (value) => setState(() => _currentIndex = value),
        itemCount: products.length,
        itemBuilder: (context, index) => ProductItem(
            product: products[index], isSelected: _currentIndex == index),
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, required this.product, required this.isSelected})
      : super(key: key);
  final Product product;
  final bool isSelected;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(
          right: 15,
          top: widget.isSelected ? 5 : 25,
          bottom: widget.isSelected ? 15 : 30),
      padding: const EdgeInsets.all(10),
      decoration: _decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _imageContainer()),
          const SizedBox(height: 7),
          _titleAndPrice(),
          _reviewsRatingsFavorite(),
        ],
      ),
    );
  }

  Widget _imageContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
            image: NetworkImage(widget.product.imageUrl), fit: BoxFit.cover),
      ),
    );
  }

  Widget _titleAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.product.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          Text('\$ ${widget.product.price}'),
        ],
      ),
    );
  }

  Widget _reviewsRatingsFavorite() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_sharp, size: 10.0),
              Text('${widget.product.isReview} reviews',
                  style: const TextStyle(fontSize: 11)),
            ],
          ),
          InkWell(
            child: Icon(
                widget.product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                size: 18),
            onTap: () {
              widget.product.toggleFavoriteStatus();
              setState(() {});
            },
          ),
          Text('⭐ ${widget.product.isRating}',
              style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  final _decoration = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(40),
    gradient: const LinearGradient(colors: [
      Color(0xFFeae4e9),
      Color(0xFFfff1e6),
      Color(0xFFf0efeb),
      Color(0xFFf0efeb),
    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
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
