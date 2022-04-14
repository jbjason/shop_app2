import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/details_widgets/comments.dart';
import 'package:shop_app2/widgets/details_widgets/custom_appbarr.dart';
import 'package:shop_app2/widgets/details_widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final f = ModalRoute.of(context)!.settings.arguments as List<String>;
    final double height = double.parse(f[0]);
    final Product product =
        Provider.of<Products>(context, listen: false).findById(f[1]);
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: ScrollController(initialScrollOffset: height * .48),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentDelegate(
              maxExtend: height,
              minExtend: height * .45,
              product: product,
            ),
          ),
          SliverToBoxAdapter(child: DetailsBody(product: product)),
        ],
      ),
      bottomNavigationBar: const CommentsContainer(),
    );
  }
}

class PersistentDelegate extends SliverPersistentHeaderDelegate {
  final double _maxExtend, _minExtend;
  final Product product;
  PersistentDelegate({
    required double maxExtend,
    required double minExtend,
    required this.product,
  })  : _maxExtend = maxExtend,
        _minExtend = minExtend;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxExtend;
    return CustomAppBarr(
      topPercent: ((1 - percent) / .7).clamp(0.0, 1.0),
      bottomPercent: (percent / .3).clamp(0.0, 1.0),
      product: product,
    );
  }

  @override
  double get maxExtent => _maxExtend;

  @override
  double get minExtent => _minExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
