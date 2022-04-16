import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';

class CustomAppBarr extends StatelessWidget {
  const CustomAppBarr({
    Key? key,
    required this.topPercent,
    required this.bottomPercent,
    required this.product,
  }) : super(key: key);
  final double topPercent, bottomPercent;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      // doesn't matter i set fit or not
      fit: StackFit.expand,
      children: [
        ImagesPreview(
            topPercent: topPercent,
            bottomPercent: bottomPercent,
            topPadding: topPadding,
            product: product),
        TitleSplashContainer(topPercent: topPercent, product: product),
        _backButton(topPadding, context),
      ],
    );
  }

  Widget _backButton(double topPadding, BuildContext context) => Positioned(
        top: topPadding,
        left: -60 * (1 - bottomPercent) + 15,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, left: 10, right: 0, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white.withOpacity(0.3)),
            child: const Icon(Icons.arrow_back_ios,color: Colors.black),
          ),
        ),
      );
}

class TitleSplashContainer extends StatelessWidget {
  const TitleSplashContainer({
    Key? key,
    required this.topPercent,
    required this.product,
  }) : super(key: key);
  final double topPercent;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: null,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: lerpDouble(20, 40, topPercent),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(CupertinoIcons.heart, color: Colors.white),
              ],
            ),
            // rating ,review , price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_sharp,
                        size: 14, color: Colors.white),
                    Text(
                      '${product.isReview} reviews',
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    const Text('✶',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Text(
                      product.isRating.toString(),
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.7),
              const Color(0xFF5c677d),
            ],
          ),
        ),
      ),
    );
  }
}

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
  Widget build(BuildContext context) {
    return ClipRect(
      child: Padding(
        padding: EdgeInsets.only(
          top: (10 + widget.topPadding) * (1 - widget.bottomPercent),
          bottom: 105 * (1 - widget.bottomPercent),
        ),
        child: Transform.scale(
          scale: lerpDouble(1, 1.3, widget.bottomPercent),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: widget.product.imageUrl.length,
                  onPageChanged: (value) =>
                      setState(() => _currentIndex = value),
                  itemBuilder: (context, index) {
                    double scale = max(viewPortion,
                        (1 - (pageOffset - index).abs()) + viewPortion);
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
                            right: 10,
                            top: 40 - scale * 20,
                            bottom: 40 - scale * 20),
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
              ),
              const SizedBox(height: 10),
              // image counter Container
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.product.imageUrl.length,
                  (index) => AnimatedContainer(
                    duration: kThemeAnimationDuration,
                    height: 4,
                    width: index == _currentIndex ? 23 : 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: index == _currentIndex
                          ? Colors.black87
                          : Colors.black12,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
