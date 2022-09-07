import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/common_widgets/app_drawer.dart';
import 'package:shop_app2/constants/delegates_.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/basic_appbar_home.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/home_custom_appbar.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/navigation_bar/floating_button.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/navigation_bar/navigation_cbar.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_product/product_all.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_recommend/recommend_all.dart';
import 'package:shop_app2/widgets/common_widgets/category_container.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height * .35;
    return Scaffold(
      body: _homeBody(_height),
      drawer: const AppDrawer(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingButton(),
      bottomNavigationBar: const NavigationCBar(),
    );
  }

  Widget _homeBody(double _height) => CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: HomeDelegate(
              maxHeight: _height,
              appbars: (shrink) => Stack(
                children: [
                  if (shrink >= 1) ...[
                    HomeCustomAppBar(disappear: (1 - shrink)),
                    BasicAppBarHome(shrink: shrink),
                  ] else ...[
                    BasicAppBarHome(shrink: shrink),
                    HomeCustomAppBar(disappear: (1 - shrink)),
                  ]
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: CategoryContainer(tag: 'home')),
          const SliverToBoxAdapter(child: ProductAll()),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            sliver: SliverToBoxAdapter(
                child: Text('  Recommended', style: TextStyle(fontSize: 22))),
          ),
          const RecommendAll(),
        ],
      );
}
