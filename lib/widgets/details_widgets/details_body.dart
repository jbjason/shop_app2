import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/theme.dart';
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
          const Text('Details', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 5),
          _detailsText(),
          const SizedBox(height: 25),
          const Text('Size', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 5),
          _sizeContainer(),
          const SizedBox(height: 15),
          const Text('Color', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 5),
          _colorContainer(),
          const SizedBox(height: 30),
          _addToCartButton(),
          const SizedBox(height: 25),
          const Text('Related Items', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          _relatedPlaces(),
        ],
      ),
    );
  }

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
        itemCount: sizeList.length,
        itemBuilder: (context, index) {
          final bool f = _selectedSize == index;
          return InkWell(
            onTap: () => setState(() => _selectedSize = index),
            child: Container(
              child: Center(
                child: Text(sizeList[index],
                    style: TextStyle(
                        color: (f &&
                                colorsList[_selectedColor].computeLuminance() <
                                    .5)
                            ? colorsList[_selectedColor]
                            : Colors.black)),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
                border: Border.all(
                    color: f ? colorsList[_selectedColor] : Colors.transparent,
                    width: 2),
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
        itemCount: colorsList.length,
        itemBuilder: ((context, index) => InkWell(
              onTap: () => setState(() => _selectedColor = index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorsList[index],
                  border: Border.all(
                      width: 4,
                      color: _selectedColor == index
                          ? Colors.white
                          : colorsList[index]),
                  boxShadow: getShadowBox(Colors.grey.shade500, Colors.white),
                ),
              ),
            )),
      ),
    );
  }

  Widget _relatedPlaces() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: imageList.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 150,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageList[imageList.length - 1 - index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _addToCartButton() {
    return Center(
      child: Container(
        height: 70,
        width: 250,
        decoration: BoxDecoration(
          gradient: SweepGradient(
            startAngle: 2,
            colors: [Colors.grey[850]!, Colors.blue[200]!],
          ),
          boxShadow: getShadowBox(Colors.grey.shade900, Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const Text('ADD TO CART',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  wordSpacing: 1.5,
                )),
          ),
        ),
      ),
    );
  }
}
