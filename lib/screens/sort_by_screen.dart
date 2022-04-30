import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/home_widgets/home_body/all_recommend/recomment_item.dart';
import 'package:shop_app2/widgets/sort_by_widgets/sort_by_body1.dart';

class SortByScreen extends StatefulWidget {
  static const routeName = '/sortby-screen';
  const SortByScreen({Key? key}) : super(key: key);
  @override
  State<SortByScreen> createState() => _SortByScreenState();
}

class _SortByScreenState extends State<SortByScreen> {
  bool _isExpand = true;
  List<Product> _categoryList = [];

  @override
  void initState() {
    super.initState();
    _categoryList =
        Provider.of<Category>(context, listen: false).getSortedList(4000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
        child: Column(
          children: [
            getAppBarTile('All Products', context),
            const SizedBox(height: 5),
            _sortByBody(),
            _listViewOfProducts(),
          ],
        ),
      ),
    );
  }

  Widget _sortByBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isExpand ? 320 : 60,
      child: Material(
        elevation: 15,
        child: Column(
          children: [
            _titleText(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _isExpand ? 260 : 0,
              child: SortByBody1(
                  products: _categoryList,
                  onChangeList: searchProductsByCondition),
            )
          ],
        ),
      ),
    );
  }

  Widget _titleText() => ListTile(
        title: const Text('Sort By'),
        trailing: IconButton(
            icon: Icon(_isExpand
                ? CupertinoIcons.rectangle_expand_vertical
                : CupertinoIcons.rectangle_compress_vertical),
            onPressed: () => setState(() => _isExpand = !_isExpand)),
      );

  Widget _listViewOfProducts() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: _categoryList.length,
        itemBuilder: ((context, index) =>
            RecommendItem(product: _categoryList[index])),
      ),
    );
  }

  void searchProductsByCondition(double highVal) {
    _categoryList =
        Provider.of<Category>(context, listen: false).getSortedList(highVal);
    _isExpand = !_isExpand;
    setState(() {});
  }
}
