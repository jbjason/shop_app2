import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products.dart';

class ProductAll extends StatefulWidget {
  const ProductAll({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<ProductAll> createState() => _ProductAllState();
}

class _ProductAllState extends State<ProductAll> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return SizedBox(
      height: widget.size.height * .42,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85, initialPage: 1),
        onPageChanged: (value) => setState(() => _currentIndex = value),
        itemCount: products.length,
        itemBuilder: (context, index) => ProductItem(
            product: products[index], isSelected: _currentIndex == index),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.product, required this.isSelected})
      : super(key: key);
  final Product product;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(
          right: 10, top: isSelected ? 5 : 25, bottom: isSelected ? 25 : 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Expanded(child: Image.network(product.imageUrl, fit: BoxFit.cover)),
          Text(product.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(product.isReview.toString()),
              const SizedBox(),
              Text(product.isRating.toString()),
            ],
          )
        ],
      ),
    );
  }
}
