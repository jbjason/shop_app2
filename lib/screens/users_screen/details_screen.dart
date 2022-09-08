import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/details_delegate.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/comments.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/appbar_details/custom_appbar_detail.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/details_body.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/details-screen';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final f = ModalRoute.of(context)!.settings.arguments as List<String>;
    final Product product =
        Provider.of<Products>(context, listen: false).findById(f[0]);
    final double height = double.parse(f[1]);
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: ScrollController(initialScrollOffset: height * .48),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: DetailsDelegate(
              maxExtend: height,
              minExtend: height * .45,
              appBars: (percent) => CustomAppBarDetail(
                topPercent: ((1 - percent) / .7).clamp(0.0, 1.0),
                bottomPercent: (percent / .3).clamp(0.0, 1.0),
                product: product,
              ),
            ),
          ),
          SliverToBoxAdapter(child: DetailsBody(product: product)),
        ],
      ),
      bottomNavigationBar: const CommentsContainer(),
    );
  }
}
