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
      false;
}

class DetailsDelegate extends SliverPersistentHeaderDelegate {
  final double maxExtend, minExtend;
  final Widget Function(double percent) appBars;
  const DetailsDelegate(
      {required this.maxExtend,
      required this.minExtend,
      required this.appBars});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / maxExtend;
    return appBars(percent);
    // return
  }

  @override
  double get maxExtent => maxExtend;

  @override
  double get minExtent => minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
