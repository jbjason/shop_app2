import 'package:flutter/material.dart';

class EditTextFields extends StatelessWidget {
  const EditTextFields(
      {Key? key,
      required this.controller,
      required this.lines,
      required this.text})
      : super(key: key);
  final TextEditingController controller;
  final int lines;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: controller.text,
      controller: controller,
      decoration: InputDecoration(labelText: text),
      maxLines: lines,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value';
        } else if (text == 'Price') {
          if (double.tryParse(value) != null) {
            return null;
          } else {
            return 'Please provide a valid number';
          }
        }
        return null;
      },
    );
  }
}
