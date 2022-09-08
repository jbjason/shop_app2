import 'package:flutter/cupertino.dart';

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
