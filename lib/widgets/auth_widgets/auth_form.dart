import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/auth_widgets/signup_button.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key, required this.submitFn, required this.isLoading})
      : super(key: key);
  final bool isLoading;
  final Function(String email, String password, String userName, bool isLogin,
      BuildContext ctx) submitFn;
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String animation_ = 'idle';
  String userEmail = '', userName = '', userPassword = '';
  final FocusNode _emailNode = FocusNode();
  final FocusNode _userNameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _flareTeddy(),
          _textFieldForm(context),
        ],
      ),
    );
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
              _emailField(),
              if (!_isLogin) _userNameField(),
              _passField(),
              SignUpButton(
                trySubmit: _trySubmit,
                isLoading: widget.isLoading,
                changeStatus: _changeStatus,
                isLogin: _isLogin,
              )
            ],
          ),
        ),
      );

  void _trySubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      setState(() => animation_ = 'success');
      await Future.delayed(const Duration(seconds: 1));
      widget.submitFn(userEmail.trim(), userPassword.trim(), userName.trim(),
          _isLogin, context);
    }
  }

  void _changeStatus() => setState(() => _isLogin = !_isLogin);

  Widget _emailField() => TextFormField(
        focusNode: _emailNode,
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
  Widget _passField() => TextFormField(
        focusNode: _passwordNode,
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
  Widget _userNameField() => TextFormField(
        focusNode: _userNameNode,
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
  Widget _flareTeddy() => SizedBox(
        height: 180,
        width: 300,
        child: FlareActor(
          'assets/Teddy.flr',
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
          animation: animation_,
          callback: (_) => setState(() => animation_ = 'idle'),
        ),
      );

  @override
  void initState() {
    super.initState();
    _emailNode.addListener(() => _listener(_emailNode, 'test', 'idle'));
    _userNameNode.addListener(() => _listener(_userNameNode, 'test', 'idle'));
    _passwordNode
        .addListener(() => _listener(_passwordNode, 'hands_up', 'hands_down'));
  }

  void _listener(FocusNode f, String s1, String s2) {
    if (f.hasFocus) {
      setState(() => animation_ = s1);
    } else {
      setState(() => animation_ = s2);
    }
  }
}
