import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/home_widgets/all_recommend/recomment_item.dart';
import 'package:shop_app2/widgets/home_widgets/category_container.dart';

class SortByScreen extends StatefulWidget {
  static const routeName = '/sortby-screen';
  const SortByScreen({Key? key}) : super(key: key);
  @override
  State<SortByScreen> createState() => _SortByScreenState();
}

class _SortByScreenState extends State<SortByScreen> {
  double lowValue = 0, highValue = 1000;
  bool _expanded = true;
  @override
  Widget build(BuildContext context) {
    final ff = Provider.of<Products>(context, listen: false);
    final sortedList = ff.items;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 10,left: 10,right: 10),
        child: Column(
          children: [
            getAppBarTile('All Products', context),
            const SizedBox(height: 5),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _expanded ? 320 : 60,
              child: Material(
                elevation: 15,
                child: Column(
                  children: [
                    _titleText(),
                    _sortByBody(ff),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: sortedList.length,
                itemBuilder: ((context, index) =>
                    RecommendItem(product: sortedList[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _titleText() => ListTile(
        title: const Text('Sort By'),
        trailing: IconButton(
            icon: Icon(_expanded
                ? CupertinoIcons.rectangle_expand_vertical
                : CupertinoIcons.rectangle_compress_vertical),
            onPressed: () => setState(() => _expanded = !_expanded)),
      );

  Widget _sortByBody(Products ff) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _expanded ? 260 : 0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _sortByTitleText('Sort By *(Price)    '),
            _rangeAmountText(),
            _pointBar(),
            _sortByTitleText('Sort By *(Category)    '),
            const CategoryContainer(),
            _applyButton(ff),
          ],
        ),
      ),
    );
  }

  Widget _rangeAmountText() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _rangeText('0', FontWeight.normal),
          _rangeText('1k', FontWeight.normal),
          _rangeText('2k', FontWeight.normal),
          _rangeText('3k', FontWeight.normal),
          _rangeText('4k', FontWeight.bold),
        ],
      );

  Widget _sortByTitleText(String s) => Container(
        color: Colors.black12,
        alignment: Alignment.centerRight,
        height: 30,
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(s),
      );

  Widget _rangeText(String s, FontWeight f) =>
      Text(s, style: TextStyle(fontWeight: f, fontSize: 11));

  Widget _applyButton(Products ff) {
    return InkWell(
      onTap: () {},
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
}
