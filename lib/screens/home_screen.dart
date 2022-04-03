import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * .1),
          // SearchBar Container
          const SearchBarContainer(),
          // Category Container
          const CategoryContainer(),
          // GridView Container
          Container(
            height: 380,
            margin: const EdgeInsets.only(bottom: 5),
            color: Colors.blue,
          ),
        ],
      ),
    ));
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
    'All Products',
    'Favorites',
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
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: 3, right: index == _category.length - 1 ? 20 : 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              color: index == selectedIndex
                  ? const Color(0xFFFEE16D)
                  : Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(children: [
              const Icon(
                Icons.donut_small_sharp,
                color: Colors.black12,
              ),
              const SizedBox(width: 10),
              Text(
                _category[index],
                style: const TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.w600),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
