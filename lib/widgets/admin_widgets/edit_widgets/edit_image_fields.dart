import 'package:flutter/material.dart';

class EditImageFields extends StatefulWidget {
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
  State<EditImageFields> createState() => _EditImageFieldsState();
}

class _EditImageFieldsState extends State<EditImageFields> {
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
                border: Border.all(width: 2, color: Colors.green),
              ),
              child: widget.controller.text.isEmpty
                  ? const Text('Enter a URL')
                  : FittedBox(
                      child: Image.network(widget.controller.text.trim(),
                          fit: BoxFit.cover),
                    ),
            ),
            Expanded(
              child: TextFormField(
                initialValue: null,
                decoration: const InputDecoration(labelText: 'Image Url'),
                keyboardType: TextInputType.url,
                controller: widget.controller,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty) {
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
                    widget.function(value);
                  }
                },
              ),
            ),
          ],
        ),
        Row(
          children: List.generate(
            widget.imagesList.length,
            (index) => Container(
              margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.imagesList[index])),
            ),
          ),
        )
      ],
    );
  }
}
