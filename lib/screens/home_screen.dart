import 'package:flutter/material.dart';
import 'package:shop_app2/app_drawer.dart';
import 'package:shop_app2/constants/delegates_.dart';
import 'package:shop_app2/widgets/home_widgets/home_appbar/basic_appbar_home.dart';
import 'package:shop_app2/widgets/home_widgets/home_appbar/custom_appbar_home.dart';
import 'package:shop_app2/widgets/home_widgets/navigation_bar/floating_button.dart';
import 'package:shop_app2/widgets/home_widgets/navigation_bar/navigation_cbar.dart';
import 'package:shop_app2/widgets/home_widgets/all_product/product_all.dart';
import 'package:shop_app2/widgets/home_widgets/all_recommend/recommend_all.dart';
import 'package:shop_app2/widgets/home_widgets/home_body/category_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _homeBody(size),
      drawer: const AppDrawer(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingButton(),
      bottomNavigationBar: const NavigationCBar(),
    );
  }

  Widget _homeBody(Size size) {
    final maxHeight = size.height * .4;
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: HomeDelegate(
            maxHeight: maxHeight,
            appbars: (shrink) => Stack(
              children: [
                BasicAppBarHome(shrink: shrink),
                CustomAppBarHome(height: maxHeight, disappear: (1 - shrink))
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: CategoryContainer(tag: 'home')),
        const SizedBox(height: 30),
        const SliverToBoxAdapter(child: ProductAll()),
        const SliverToBoxAdapter(child: RecommendAll())
      ],
    );
  }
}
