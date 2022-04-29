import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/product.dart';

class DetailsBody extends StatefulWidget {
  const DetailsBody({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  bool _isExpanded = false;
  int _selectedSize = 0;
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _titlePortion('Details'),
          Padding(padding: const EdgeInsets.all(8.0), child: _detailsText()),
          const SizedBox(height: 20),
          _titlePortion('Size'),
          const SizedBox(height: 5),
          _sizeContainer(),
          const SizedBox(height: 15),
          _titlePortion('Color'),
          const SizedBox(height: 5),
          _colorContainer(),
          const SizedBox(height: 30),
          _addToCartButton(context),
          const SizedBox(height: 25),
          _titlePortion('Related Items'),
          const SizedBox(height: 10),
          _relatedPlaces(),
        ],
      ),
    );
  }

  Widget _titlePortion(String s) =>
      Text(s, style: const TextStyle(fontSize: 18));
  Widget _detailsText() {
    if (widget.product.description.length > 190 && !_isExpanded) {
      return RichText(
        text: TextSpan(
          text: widget.product.description.substring(0, 190 + 1) + '.',
          style: const TextStyle(color: AppColors.textDark),
          children: [
            TextSpan(
              text: '...Read more',
              recognizer: TapGestureRecognizer()
                ..onTap = () => setState(() => _isExpanded = true),
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    } else if (widget.product.description.length < 190) {
      return Text(widget.product.description);
    } else {
      return RichText(
        text: TextSpan(
            text: widget.product.description,
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: '  ...Show less',
                style: const TextStyle(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => setState(() => _isExpanded = false),
              )
            ]),
      );
    }
  }

  Widget _sizeContainer() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.size.length,
        itemBuilder: (context, index) {
          final bool f = _selectedSize == index;
          return InkWell(
            onTap: () => setState(() => _selectedSize = index),
            child: Container(
              child: Center(
                child: Text(
                  widget.product.size[index],
                  style: TextStyle(
                    color: (f &&
                            widget.product.color[_selectedColor]
                                    .computeLuminance() <
                                .5)
                        ? widget.product.color[_selectedColor]
                        : Colors.black,
                  ),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
                border: Border.all(
                  color: f
                      ? widget.product.color[_selectedColor]
                      : Colors.transparent,
                  width: 2,
                ),
                boxShadow: getShadowBox(Colors.grey.shade500, Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _colorContainer() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.color.length,
        itemBuilder: ((context, index) => InkWell(
              onTap: () => setState(() => _selectedColor = index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.product.color[index],
                  border: Border.all(
                      width: 4,
                      color: _selectedColor == index
                          ? Colors.white
                          : widget.product.color[index]),
                  boxShadow: getShadowBox(Colors.grey.shade500, Colors.white),
                ),
              ),
            )),
      ),
    );
  }

  Widget _addToCartButton(BuildContext context) {
    return Center(
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          color: Colors.grey[300],
          decoration: BoxDecoration(
              boxShadow: getShadowBox(Colors.white, Colors.grey[600]!)),
          alignment: Alignment.center,
          child: const Text('ADD TO CART',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  wordSpacing: 1.5)),
        ),
        onTap: () {
          final s = Provider.of<Cart>(context, listen: false)
              .addItem(widget.product, _selectedColor, _selectedSize);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text(s), duration: const Duration(seconds: 1)));
        },
      ),
    );
  }

  Widget _relatedPlaces() {
    final length = widget.product.imageUrl.length;
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: length,
        scrollDirection: Axis.horizontal,
        itemExtent: 150,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.product.imageUrl[length - 1 - index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
