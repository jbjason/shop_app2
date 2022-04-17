import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'dart:math';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/providers/products.dart';

class OffersScreen extends StatefulWidget {
  static const routeName = '/offers-screen';
  const OffersScreen({Key? key}) : super(key: key);
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);

  void _listener() {
    _notifierScroll.value = _controller.page!;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ValueListenableBuilder<double>(
              valueListenable: _notifierScroll,
              builder: (context, value, _) => _body(context, value),
            ),
            getAppBarTile('My Offers', context),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, double value) {
    final products = Provider.of<Products>(context, listen: false).items;
    final size = MediaQuery.of(context).size;

    return PageView.builder(
      controller: _controller,
      itemBuilder: (context, index) {
        final percent = index - value;
        final rotation = percent.clamp(0.0, 1.0);
        final fixRotation = pow(rotation, 0.35);
        return Container(
          margin: const EdgeInsets.only(top: 60),
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _itemBody(
                  size, rotation, fixRotation, products[index].imageUrl[1]),
              const SizedBox(height: 30),
              TitleAndAuthor(
                  rotation: rotation, index: index, product: products[index]),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }

  Widget _itemBody(Size size, double rotation, num fixRotation, String image) {
    final _itemHeight = size.height * .55;
    final _itemWidth = size.width * .75;
    return Center(
      child: Stack(
        children: [
          Container(
            height: _itemHeight,
            width: _itemWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            ),
          ),
          Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateY(1.8 * fixRotation)
              ..translate(-rotation * size.width * 0.8)
              ..scale(1 + rotation),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: _itemHeight,
              width: _itemWidth,
            ),
          ),
        ],
      ),
    );
  }
}

class TitleAndAuthor extends StatelessWidget {
  const TitleAndAuthor({
    Key? key,
    required this.rotation,
    required this.index,
    required this.product,
  }) : super(key: key);
  final Product product;
  final double rotation;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1 - rotation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 10),
          const Text(
            'Popeye Jas Pompai',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
