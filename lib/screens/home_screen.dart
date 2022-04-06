import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/home_widgets/product_all.dart';
import 'package:shop_app2/widgets/home_widgets/recommend_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // SearchBar Container
            const SearchBarContainer(),
            const SizedBox(height: 30),
            // Category Container
            const CategoryContainer(),
            const SizedBox(height: 30),
            // all Proudcts
            ProductAll(size: size),
            RecommendAll(size: size),
          ],
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
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _category.length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () => setState(() => selectedIndex = index),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: 3, right: index == _category.length - 1 ? 10 : 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                color: index == selectedIndex
                    ? const Color(0xFFFEE16D)
                    : Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              _category[index]),
          ),
        ),
      ),
    );
  }
}
