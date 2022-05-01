import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';

class ImagesPreview extends StatefulWidget {
  const ImagesPreview(
      {Key? key,
      required this.topPercent,
      required this.bottomPercent,
      required this.topPadding,
      required this.product})
      : super(key: key);
  final double topPercent, bottomPercent, topPadding;
  final Product product;

  @override
  State<ImagesPreview> createState() => _ImagesPreviewState();
}

class _ImagesPreviewState extends State<ImagesPreview> {
  int _currentIndex = 0;
  late var pageController = PageController();
  double pageOffset = 0;
  double viewPortion = 0.9;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: viewPortion)
      ..addListener(() => setState(() => pageOffset = pageController.page!));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.product.id,
      child: ClipRect(
        child: Padding(
          padding: EdgeInsets.only(
            top: (10 + widget.topPadding) * (1 - widget.bottomPercent),
            bottom: 105 * (1 - widget.bottomPercent),
          ),
          child: Transform.scale(
            scale: lerpDouble(1, 1.3, widget.bottomPercent),
            child: Column(
              children: [
                // all images
                _allImagesOfProduct(),
                const SizedBox(height: 10),
                // image counter Container
                _imageCounterContainer(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _allImagesOfProduct() => Expanded(
        child: PageView.builder(
          controller: pageController,
          itemCount: widget.product.imageUrl.length,
          onPageChanged: (value) => setState(() => _currentIndex = value),
          itemBuilder: (context, index) {
            double scale = max(
                viewPortion, (1 - (pageOffset - index).abs()) + viewPortion);
            double angle = (pageOffset - index).abs();
            if (angle > .5) {
              angle = 1 - angle;
            }
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(1.8 * angle),
              child: Container(
                margin: EdgeInsets.only(
                    right: 10, top: 40 - scale * 20, bottom: 40 - scale * 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(widget.product.imageUrl[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      );

  Widget _imageCounterContainer() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.product.imageUrl.length,
          (index) => AnimatedContainer(
            duration: kThemeAnimationDuration,
            height: 4,
            width: index == _currentIndex ? 23 : 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: index == _currentIndex ? Colors.black87 : Colors.black12,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
          ),
        ),
      );
}
