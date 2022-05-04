import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class EditSizeField extends StatelessWidget {
  const EditSizeField(
      {Key? key,
      required this.function,
      required this.sizeList})
      : super(key: key);
  final void Function(String s) function;
  final List<String> sizeList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: null,
          decoration: const InputDecoration(labelText: 'Size'),
          maxLines: 1,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please provide a value';
            }
            return null;
          },
          onFieldSubmitted: (val) {
            if (val.isNotEmpty) {
              function(val);
            }
          },
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          child: Row(
            children: List.generate(
              sizeList.length,
              (index) => Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.accent, width: 1),
                ),
                child: Text(
                  sizeList[index],
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
