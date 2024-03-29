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
  final _currentIndex = ValueNotifier<int>(0);
  late var pageController = PageController();
  final _pageOffset = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.9)
      ..addListener(() => _pageOffset.value = pageController.page!);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.product.id + widget.product.title,
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
          onPageChanged: (value) => _currentIndex.value = value,
          itemBuilder: (context, index) => ValueListenableBuilder(
              valueListenable: _pageOffset,
              builder: (context, double pageOffVal, _) {
                double percent = 1 - (pageOffVal - index).abs();
                return Container(
                  margin: EdgeInsets.only(right: 10, top: 55 - percent * 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(widget.product.imageUrl[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        ),
      );

  Widget _imageCounterContainer() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.product.imageUrl.length,
          (i) => ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, int currentIndex, _) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: i == currentIndex ? 23 : 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: i == currentIndex ? Colors.black87 : Colors.black12,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
            ),
          ),
        ),
      );
}
