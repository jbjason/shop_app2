import 'package:flutter/material.dart';

class UserDetailsField extends StatelessWidget {
  const UserDetailsField({
    Key? key,
    required TextEditingController addressController,
  })  : _addressController = addressController,
        super(key: key);
  final TextEditingController _addressController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Detail address'),
      maxLines: 3,
      controller: _addressController,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide full address !';
        } else if (value.length < 11) {
          return 'Should be at least 10 characters';
        }
        return null;
      },
    );
  }
}

