import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthEmailField extends StatelessWidget {
  AuthEmailField({Key? key, required this.emailNode, required this.userEmail})
      : super(key: key);
  String userEmail;
  final FocusNode emailNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: emailNode,
      key: const ValueKey('email'),
      decoration: const InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => userEmail = value!,
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}
