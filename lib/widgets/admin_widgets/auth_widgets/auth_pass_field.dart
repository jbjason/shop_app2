import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthPassField extends StatelessWidget {
  AuthPassField(
      {Key? key, required this.userPassword, required this.passwordNode})
      : super(key: key);
  String userPassword;
  final FocusNode passwordNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: passwordNode,
      key: const ValueKey('password'),
      decoration: const InputDecoration(labelText: 'Password'),
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      onSaved: (value) => userPassword = value!,
      validator: (value) {
        if (value!.isEmpty || value.length < 7) {
          return 'Please enter atleast 7 characters';
        }
        return null;
      },
    );
  }
}
