import 'package:flutter/material.dart';
import 'package:shop_app2/constants/theme.dart';

class EditImageFields extends StatelessWidget {
  const EditImageFields(
      {Key? key,
      required this.controller,
      required this.function,
      required this.imagesList})
      : super(key: key);
  final TextEditingController controller;
  final void Function(String s) function;
  final List<String> imagesList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(top: 8, right: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: AppColors.accent),
              ),
              child: controller.text.isEmpty
                  ? const Center(child: Text('Enter a URL'))
                  : Image.network(controller.text.trim(), fit: BoxFit.cover),
            ),
            Expanded(
              child: TextFormField(
                initialValue: null,
                decoration: const InputDecoration(labelText: 'Image Url'),
                keyboardType: TextInputType.url,
                controller: controller,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty && imagesList.isEmpty) {
                    return 'Please enter a Url';
                  } else if ((!value.startsWith('http') &&
                      !value.startsWith('https'))) {
                    return 'Please enter a valid Url';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty ||
                      value.startsWith('http') ||
                      value.startsWith('https')) {
                    function(value);
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          child: Row(
            children: List.generate(
              imagesList.length,
              (index) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                    backgroundImage: NetworkImage(imagesList[index])),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
