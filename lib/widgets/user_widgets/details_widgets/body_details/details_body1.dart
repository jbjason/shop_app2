import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/add_to_cart_button.dart';

class DetailsBody1 extends StatefulWidget {
  const DetailsBody1({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<DetailsBody1> createState() => _DetailsBody1State();
}

class _DetailsBody1State extends State<DetailsBody1> {
  bool _isExpanded = false;
  int _selectedSize = 0, _selectedColor = 0;
  double _topVal = -94, _bottomVal = -50;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _topAnimateCircle(),
        _bottomAnimateCircle(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titlePortion('Details'),
              Padding(
                  padding: const EdgeInsets.all(8.0), child: _detailsText()),
              const SizedBox(height: 20),
              _titlePortion('Size'),
              const SizedBox(height: 5),
              _sizeContainer(),
              const SizedBox(height: 15),
              _titlePortion('Color'),
              const SizedBox(height: 5),
              _colorContainer(),
              const SizedBox(height: 35),
              AddToCartButton(
                product: widget.product,
                selectedColor: _selectedColor,
                selectedSize: _selectedSize,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _titlePortion(String s) => Text(
        s,
        style: TextStyle(
            color: _selectedColor == 0
                ? AppColors.textDark
                : widget.product.color[_selectedColor],
            fontSize: 18),
      );

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
      height: 55,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 15),
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.color.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _selectedColor = index;
              _topVal =
                  (_topVal + 19) % 2 == 0 ? (_topVal - 19) : (_topVal + 19);
              _bottomVal = (_bottomVal + 19) % 2 == 0
                  ? (_bottomVal + 19)
                  : (_bottomVal - 19);
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 40,
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
        ),
      ),
    );
  }

  Widget _topAnimateCircle() => AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeIn,
      top: _topVal,
      right: _topVal,
      child: _animateContainer('t'));

  Widget _bottomAnimateCircle() => AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeIn,
      bottom: _bottomVal,
      left: _bottomVal - 10,
      child: _animateContainer('b'));

  Widget _animateContainer(String s) => Container(
        height: s == 't' ? 280 : 220,
        width: s == 't' ? 280 : 220,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            widget.product.color[_selectedColor].withOpacity(0.07),
            widget.product.color[_selectedColor].withOpacity(0.13),
            widget.product.color[_selectedColor].withOpacity(0.18),
          ]),
          shape: BoxShape.circle,
        ),
      );
}
