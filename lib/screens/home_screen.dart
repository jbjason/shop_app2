import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/app_drawer.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/screens/cart_screen.dart';
import 'package:shop_app2/widgets/home_widgets/home_appbar/search_bar.dart';
import 'package:shop_app2/widgets/home_widgets/navigation_bar/badge.dart';
import 'package:shop_app2/widgets/home_widgets/home_body/category_container.dart';
import 'package:shop_app2/widgets/home_widgets/navigation_bar/navigation_cbar.dart';
import 'package:shop_app2/widgets/home_widgets/all_product/product_all.dart';
import 'package:shop_app2/widgets/home_widgets/all_recommend/recommend_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 40),
            // SearchBar Container
            SearchBar(),
            SizedBox(height: 20),
            // Category Container
            CategoryContainer(tag: 'home'),
            SizedBox(height: 30),
            // all Proudcts
            ProductAll(),
            RecommendAll(),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingButton(context),
      bottomNavigationBar: const NavigationCBar(),
    );
  }

  Widget _floatingButton(BuildContext context) {
    return Consumer<Cart>(
      builder: (_, cart, ch) {
        final f = cart.itemCount;
        return Badge(
            child: ch!,
            value: f.toString(),
            color: f != 0 ? const Color(0xFFfaedcd) : Colors.transparent);
      },
      child: getButtonDecoration(
        70,
        70,
        BoxShape.circle,
        [],
        FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(CartScreen.routeName),
          child: const Icon(CupertinoIcons.shopping_cart),
        ),
      ),
    );
  }
}
