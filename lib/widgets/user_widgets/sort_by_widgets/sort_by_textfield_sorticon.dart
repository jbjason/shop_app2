import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class SortByTextFieldSortIcon extends StatelessWidget {
  const SortByTextFieldSortIcon(
      {Key? key,
      required this.controller,
      required this.onPress,
      required this.isExpand})
      : super(key: key);

  final TextEditingController controller;
  final ValueNotifier<bool> isExpand;
  final Function(String s) onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                labelText: 'Search here',
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: AppColors.accent.withOpacity(0.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:
                      const BorderSide(width: 2, color: AppColors.secondary),
                ),
              ),
              textInputAction: TextInputAction.done,
              onChanged: (String val) => onPress(val),
            ),
          ),
        ),
        IconButton(
          icon: Icon(isExpand.value
              ? CupertinoIcons.rectangle_expand_vertical
              : CupertinoIcons.rectangle_compress_vertical),
          onPressed: () => isExpand.value = !isExpand.value,
        ),
      ],
    );
  }
}
