import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/details_widgets/custom_appbarr.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';
  const DetailsScreen({Key? key, required this.size, required this.images})
      : super(key: key);
  final Size size;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentDelegate(
                maxExtend: size.height, minExtend: size.height*.4, images: images),
          ),
          const SliverToBoxAdapter(child: Placeholder(color: Colors.transparent)),
          const SliverToBoxAdapter(child: Placeholder(color: Colors.transparent)),
        ],
      ),
    );
  }
}

class PersistentDelegate extends SliverPersistentHeaderDelegate {
  final double _maxExtend, _minExtend;
  final List<String> _images;
  PersistentDelegate({
    required double maxExtend,
    required double minExtend,
    required List<String> images,
  })  : _maxExtend = maxExtend,
        _minExtend = minExtend,
        _images = images;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CustomAppBarr(percent: shrinkOffset / _maxExtend, images: _images);
  }

  @override
  double get maxExtent => _maxExtend;

  @override
  double get minExtent => _minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
