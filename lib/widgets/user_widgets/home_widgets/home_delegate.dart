import 'package:flutter/material.dart';

class HomeDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final Widget Function(double percent) appbars;
  const HomeDelegate({required this.maxHeight, required this.appbars});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final shrink = shrinkOffset / maxHeight;
    return appbars(shrink);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => kToolbarHeight + 35;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
