import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/auth_form.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(submitFn: _submitAuthForm, isLoading: false),
    );
  }

  void _submitAuthForm(String emaill, String passwordd, String username,
      bool isLogin, BuildContext ctx) {}
}
