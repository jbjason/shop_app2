import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/details_widgets/images_preview.dart';
import 'package:shop_app2/widgets/details_widgets/title_splash_container.dart';

class CustomAppBarrDetail extends StatelessWidget {
  const CustomAppBarrDetail({
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
            child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
      );
}
