import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/auth_email_field.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/auth_name_field.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/auth_pass_field.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/flare_actor.dart';

// ignore: must_be_immutable
class AuthForm extends StatefulWidget {
  AuthForm(
      {Key? key,
      required this.submitFn,
      required this.isLoading,
      required this.animation_})
      : super(key: key);
  final bool isLoading;
  String animation_;
  final Function(String email, String password, String userName, bool isLogin,
      BuildContext ctx) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String userEmail = '', userName = '', userPassword = '';
  final FocusNode _emailNode = FocusNode();
  final FocusNode userNameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FlareTeddy(animation: widget.animation_),
          _textFieldForm(context),
        ],
      ),
    );
  }

  void _trySubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      setState(() => widget.animation_ = 'success');
      widget.submitFn(userEmail.trim(), userPassword.trim(), userName.trim(),
          _isLogin, context);
    }
  }

  Widget _textFieldForm(BuildContext context) => Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white38,
          ),
          child: Column(
            children: [
              AuthEmailField(emailNode: _emailNode, userEmail: userEmail),
              if (!_isLogin)
                AuthNameField(userName: userName, userNameNode: userNameNode),
              AuthPassField(
                  userPassword: userPassword, passwordNode: _passwordNode),
              _buttonloginSignup(context),
            ],
          ),
        ),
      );

  Widget _buttonloginSignup(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        widget.isLoading
            ? const CircularProgressIndicator()
            : Container(
                width: double.infinity,
                height: 70,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => _trySubmit(context),
                  child: Text(
                    _isLogin ? 'Login' : 'Signup',
                    style: const TextStyle(
                        color: Color(0xFF1F787A),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
        if (!widget.isLoading)
          TextButton(
            onPressed: () => setState(() => _isLogin = !_isLogin),
            child: Text(
              _isLogin ? 'Create new account' : 'I already have an account',
              style: const TextStyle(color: Colors.black),
            ),
          )
      ],
    );
  }

  void _listener(FocusNode f, String s1, String s2) {
    if (f.hasFocus) {
      setState(() => widget.animation_ = s1);
    } else {
      setState(() => widget.animation_ = s2);
    }
  }

  @override
  void initState() {
    super.initState();
    _emailNode.addListener(() => _listener(_emailNode, 'test', 'idle'));
    userNameNode.addListener(() => _listener(userNameNode, 'test', 'idle'));
    _passwordNode
        .addListener(() => _listener(_passwordNode, 'hands_up', 'hands_down'));
  }
}
