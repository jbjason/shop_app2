import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    Key? key,
    required TextEditingController nameController,
  })  : _nameController = nameController,
        super(key: key);

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Name'),
      textInputAction: TextInputAction.next,
      controller: _nameController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a name !';
        }
        return null;
      },
    );
  }
}
