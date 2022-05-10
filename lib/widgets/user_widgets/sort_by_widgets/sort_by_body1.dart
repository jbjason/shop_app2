import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/common_widgets/extra_/category_container.dart';
import 'package:shop_app2/widgets/user_widgets/sort_by_widgets/range_amount_text.dart';

class SortByBody1 extends StatefulWidget {
  const SortByBody1(
      {Key? key, required this.products, required this.onChangeList})
      : super(key: key);
  final List<Product> products;
  final Function(double highVal) onChangeList;
  @override
  State<SortByBody1> createState() => _SortByBody1State();
}

class _SortByBody1State extends State<SortByBody1> {
  double lowValue = 0, highValue = 1000;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _sortByTitleText('Sort By *(Price)    '),
          const RangeAmountText(),
          _pointBar(),
          _sortByTitleText('Sort By *(Category)    '),
          const CategoryContainer(tag: 'sort'),
          _applyButton(widget.products),
        ],
      ),
    );
  }

  Widget _sortByTitleText(String s) => Container(
        color: Colors.black12,
        alignment: Alignment.centerRight,
        height: 30,
        margin: const EdgeInsets.only(bottom: 10),
        child: Text(s),
      );

  Widget _applyButton(List<Product> products) {
    return InkWell(
      onTap: () => widget.onChangeList(highValue),
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
