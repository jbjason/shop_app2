import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/screens/cart_screen.dart';
import 'package:shop_app2/widgets/home_widgets/navigation_cbar.dart';
import 'package:shop_app2/widgets/home_widgets/product_all.dart';
import 'package:shop_app2/widgets/home_widgets/recommend_all.dart';

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
            SearchBarContainer(),
            SizedBox(height: 30),
            // Category Container
            CategoryContainer(),
            SizedBox(height: 30),
            // all Proudcts
            ProductAll(),
            RecommendAll(),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CartScreen.routeName);
        },
        child: const Icon(CupertinoIcons.shopping_cart),
      ),
      bottomNavigationBar: const NavigationCBar(),
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

// ignore: must_be_immutable
class CategoryContainer extends StatefulWidget {
  const CategoryContainer({Key? key}) : super(key: key);

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  final List<String> _category = [
    'All',
    'Electronics',
    'Sports',
    'Groceries',
    'Cloths'
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _category.length,
        itemBuilder: (ctx, index) {
          final bool f = index == selectedIndex;
          return InkWell(
            onTap: () => setState(() => selectedIndex = index),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(
                  left: 3, right: index == _category.length - 1 ? 10 : 5),
              decoration: BoxDecoration(
                color:
                    f ? AppColors.accent.withOpacity(0.5) : Colors.transparent,
                borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(10),
                  bottomLeft: const Radius.circular(10),
                  topLeft: f ? const Radius.circular(40) : const Radius.circular(10),
                  bottomRight: f ? const Radius.circular(40) : const Radius.circular(10),
                ),
              ),
              child: Text(_category[index]),
            ),
          );
        },
      ),
    );
  }
}
