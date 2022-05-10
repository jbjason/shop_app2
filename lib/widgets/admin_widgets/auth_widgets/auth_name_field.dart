import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthNameField extends StatelessWidget {
  AuthNameField({Key? key, required this.userName, required this.userNameNode})
      : super(key: key);
  String userName;
  final FocusNode userNameNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: userNameNode,
      key: const ValueKey('username'),
      decoration: const InputDecoration(labelText: 'Username'),
      onSaved: (value) => userName = value!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter atleast 4 characters';
        }
        return null;
      },
    );
  }
}
