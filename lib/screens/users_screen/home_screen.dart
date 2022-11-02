import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/common_widgets/app_drawer.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_pro_category/pro_all.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_delegate.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/basic_appbar_home.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_appbar/home_custom_appbar.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/home_offer/home_offer.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/navigation_bar/floating_button.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/navigation_bar/navigation_cbar.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_recommend/recommend_all.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
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
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: HomeDelegate(
            maxHeight: size.height * .32,
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
        const SliverToBoxAdapter(child: HomeOffer()),
        const SliverToBoxAdapter(child: CategoryProductAll()),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          sliver: SliverToBoxAdapter(
              child: Text('  Recommended', style: TextStyle(fontSize: 18))),
        ),
        const RecommendAll(),
      ],
    );
  }
}
