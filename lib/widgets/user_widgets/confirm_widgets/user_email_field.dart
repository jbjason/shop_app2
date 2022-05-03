import 'package:flutter/material.dart';

class UserEmailField extends StatelessWidget {
  const UserEmailField({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      textInputAction: TextInputAction.next,
      controller: _emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a email-address !';
        } else if (!value.contains('@') || !value.contains('.com')) {
          return 'Invalid email-adrress';
        }
        return null;
      },
    );
  }
}
