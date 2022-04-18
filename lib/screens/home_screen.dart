import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/app_drawer.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/screens/cart_screen.dart';
import 'package:shop_app2/widgets/home_widgets/badge.dart';
import 'package:shop_app2/widgets/home_widgets/category_container.dart';
import 'package:shop_app2/widgets/home_widgets/navigation_cbar.dart';
import 'package:shop_app2/widgets/home_widgets/all_product/product_all.dart';
import 'package:shop_app2/widgets/home_widgets/all_recommend/recommend_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // SearchBar Container
            const SearchBarContainer(),
            const SizedBox(height: 20),
            // Category Container
            CategoryContainer(currentIndex: (_) {}),
            const SizedBox(height: 30),
            // all Proudcts
            const ProductAll(),
            const RecommendAll(),
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

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Material(
        elevation: 7.0,
        borderRadius: BorderRadius.circular(5.0),
        child: TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon:
                Icon(Icons.search, color: Color(0xFFFEDF62), size: 30.0),
            contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
