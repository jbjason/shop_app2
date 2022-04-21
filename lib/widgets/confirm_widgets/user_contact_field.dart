import 'package:flutter/material.dart';

class UserContactField extends StatelessWidget {
  const UserContactField({
    Key? key,
    required TextEditingController contactController,
  })  : _contactController = contactController,
        super(key: key);

  final TextEditingController _contactController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Contact'),
      textInputAction: TextInputAction.next,
      controller: _contactController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a contact number !';
        } else if (double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }
}
