import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/user_widgets/home_widgets/home_body/all_recommend/recomment_item.dart';
import 'package:shop_app2/widgets/common_widgets/category_container.dart';
import 'package:shop_app2/widgets/user_widgets/sort_by_widgets/range_amount_text.dart';
import 'package:shop_app2/constants/theme.dart';

class SortByScreen extends StatefulWidget {
  static const routeName = '/sortby-screen';
  const SortByScreen({Key? key}) : super(key: key);
  @override
  State<SortByScreen> createState() => _SortByScreenState();
}

class _SortByScreenState extends State<SortByScreen> {
  bool _isExpand = false;
  List<Product> _availableProducts = [], _suggestions = [];
  final _controller = TextEditingController();
  double lowValue = 0, highValue = 1000;
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
            _listViewOfProducts(),
          ],
        ),
      ),
    );
  }

  Widget _sortBody() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isExpand ? 335 : 80,
      child: Column(
        children: [
          // TextField & sort by icon
          _textFieldAndSortIcon(),
          const SizedBox(height: 10),
          // category ,value range slider & apply button
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isExpand ? 250 : 0,
            child: Material(
              elevation: 15,
              child: ListView(
                children: [
                  CategoryContainer(
                      tag: 'sort', selectedCategory: _onCategoryChange),
                  const RangeAmountText(),
                  _pointBar(),
                  _applyButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textFieldAndSortIcon() => Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.accent),
                  ),
                ),
                onChanged: _searchProduct,
              ),
            ),
          ),
          IconButton(
            icon: Icon(_isExpand
                ? CupertinoIcons.rectangle_expand_vertical
                : CupertinoIcons.rectangle_compress_vertical),
            onPressed: () => setState(() => _isExpand = !_isExpand),
          ),
        ],
      );

  Widget _listViewOfProducts() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: _suggestions.length,
        itemBuilder: ((context, index) =>
            RecommendItem(product: _suggestions[index])),
      ),
    );
  }

  Widget _pointBar() {
    RangeValues values = RangeValues(lowValue, highValue);
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 4,
        thumbColor: Colors.red,
        activeTrackColor: Colors.red.shade200,
        inactiveTrackColor: Colors.red.shade50,
        rangeThumbShape:
            const RoundRangeSliderThumbShape(enabledThumbRadius: 6),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
      ),
      child: RangeSlider(
        values: values,
        min: 0,
        max: 4000,
        divisions: 4,
        labels: RangeLabels(
          values.start.round().toString(),
          values.end.round().toString(),
        ),
        onChanged: (val) => setState(() => highValue = val.end),
      ),
    );
  }

  Widget _applyButton() {
    return InkWell(
      onTap: () {
        final queValue = _controller.text.trim();
        final _list = _availableProducts.where((element) {
          if (_selectedCategory == "All") {
            return element.title.contains(queValue) &&
                element.price <= highValue;
          }
          return element.title.contains(queValue) &&
              element.price <= highValue &&
              element.category == _selectedCategory;
        }).toList();
        setState(() => _suggestions = _list);
      },
      child: Container(
        width: 200,
        height: 40,
        margin: const EdgeInsets.only(top: 8),
        color: AppColors.accent,
        child: const Center(
            child: Text('Apply',
                style:
                    TextStyle(letterSpacing: 1.5, color: AppColors.textLigth))),
      ),
    );
  }

  void _onCategoryChange(String s) => _selectedCategory = s;

  void _searchProduct(String query) {
    final _query = query.toLowerCase();
    final _list = _availableProducts.where((product) {
      final _suggestion = product.title.toLowerCase();
      return _suggestion.contains(_query);
    }).toList();
    setState(() => _suggestions = _list);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
