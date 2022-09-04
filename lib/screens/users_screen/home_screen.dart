import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/common_widgets/app_drawer.dart';
import 'package:shop_app2/constants/delegates_.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/basic_appbar_home.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/custom_appbar_home.dart';
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
    return Scaffold(
      body: _homeBody(context),
      drawer: const AppDrawer(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingButton(),
      bottomNavigationBar: const NavigationCBar(),
    );
  }

  Widget _homeBody(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * .35;
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
        const SliverToBoxAdapter(child: SizedBox(height: 10)),
        const SliverToBoxAdapter(child: ProductAll()),
        const SliverToBoxAdapter(child: RecommendAll())
      ],
    );
  }
}
