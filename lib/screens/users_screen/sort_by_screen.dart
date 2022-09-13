import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_others.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/common_widgets/category_container.dart';
import 'package:shop_app2/widgets/user_widgets/sort_by_widgets/range_amount_text.dart';
import 'package:shop_app2/widgets/user_widgets/sort_by_widgets/sort_by_apply_button.dart';
import 'package:shop_app2/widgets/user_widgets/sort_by_widgets/sort_by_listview_pro.dart';
import 'package:shop_app2/widgets/user_widgets/sort_by_widgets/sort_by_slider.dart';
import 'package:shop_app2/widgets/user_widgets/sort_by_widgets/sort_by_textfield_sorticon.dart';

class SortByScreen extends StatefulWidget {
  static const routeName = '/sortby-screen';
  const SortByScreen({Key? key}) : super(key: key);
  @override
  State<SortByScreen> createState() => _SortByScreenState();
}

class _SortByScreenState extends State<SortByScreen> {
  final _controller = TextEditingController();
  final _isExpand = ValueNotifier<bool>(false);
  final highValue = ValueNotifier<double>(1000);
  List<Product> _availableProducts = [], _suggestions = [];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _availableProducts = Provider.of<Products>(context, listen: false).items;
    _suggestions = _availableProducts;
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
            const SizedBox(height: 10),
            // textFeild, category ,value range slider & apply button
            _sortBody(),
            // condition mathced products
            SortByListViewPro(suggestions: _suggestions),
          ],
        ),
      ),
    );
  }

  Widget _sortBody() => ValueListenableBuilder(
        valueListenable: _isExpand,
        builder: (context, val, _) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isExpand.value ? 335 : 80,
          child: Column(
            children: [
              // TextField & sort by icon
              SortByTextFieldSortIcon(
                  controller: _controller,
                  onPress: _searchProduct,
                  isExpand: _isExpand),
              const SizedBox(height: 10),
              // category ,value range slider & apply button
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _isExpand.value ? 250 : 0,
                child: Material(
                  elevation: 15,
                  child: ListView(
                    children: [
                      CategoryContainer(selectedCategory: _onCategoryChange),
                      const RangeAmountText(),
                      SortBySlider(highValue: highValue),
                      SortByApplyButton(onPress: _onPressApplyButton),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  void _onCategoryChange(String s) => _selectedCategory = s;

  void _searchProduct(String query) {
    final _query = query.toLowerCase();
    final _list = _availableProducts.where((product) {
      final _title = product.title.toLowerCase();
      final _subtitle = product.subtitle.toLowerCase();
      return _title.contains(_query) || _subtitle.contains(_query);
    }).toList();
    setState(() => _suggestions = _list);
  }

  void _onPressApplyButton() {
    final queValue = _controller.text.trim();
    final _list = _availableProducts.where((element) {
      if (_selectedCategory == "All") {
        return element.title.contains(queValue) &&
            element.price <= highValue.value;
      }
      // title & subtitle both in search condition
      return (element.title.contains(queValue) ||
              element.subtitle.contains(queValue)) &&
          (element.price <= highValue.value &&
              element.category == _selectedCategory);
    }).toList();
    _suggestions = _list;
    _isExpand.value = false;
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
