import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/add_to_cart_button.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/details_color.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/details_text.dart';
import 'package:shop_app2/widgets/user_widgets/details_widgets/body_details/detials_size.dart';

class DetailsBody1 extends StatelessWidget {
  DetailsBody1({Key? key, required this.product}) : super(key: key);
  final Product product;
  final _selectedSize = ValueNotifier<int>(0);
  final selectedColor = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ValueListenableBuilder(
        valueListenable: selectedColor,
        builder: (context, int colorIndex, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _colorContainer(),
            const SizedBox(height: 7),
            _sizeContainer(colorIndex),
            const SizedBox(height: 50),
            _titlePortion('Details'),
            // details
            DetailsText(text: product.description),
            const SizedBox(height: 25),
            AddToCartButton(
              product: product,
              selectedColor: colorIndex,
              selectedSize: _selectedSize.value,
            ),
          ],
        ),
      ),
    );
  }

  Widget _sizeContainer(int colorIndex) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          _titlePortion('Size'),
          const SizedBox(width: 10),
          Expanded(
            child: DetailsSize(
              selectedSize: _selectedSize,
              sizes: product.size,
              color: product.color[colorIndex],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorContainer() {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          _titlePortion('Color'),
          const SizedBox(width: 10),
          Expanded(
            child: DetailsColor(
                colors: product.color, selectedColor: selectedColor),
          ),
        ],
      ),
    );
  }

  Widget _titlePortion(String title) => Text(
        title,
        style: TextStyle(
          color: selectedColor.value == 0
              ? AppColors.textDark
              : product.color[selectedColor.value],
          fontSize: 18,
        ),
      );
}
