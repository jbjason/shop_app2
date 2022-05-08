import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(
      {Key? key,
      required this.submitFn,
      required this.isLoading,
      required this.isError})
      : super(key: key);
  final bool isLoading, isError;
  final Function(String email, String password, String userName, bool isLogin,
      BuildContext ctx) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '', _userName = '', _userPassword = '';
  final FocusNode _emailNode = FocusNode();
  final FocusNode _userNameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  String _animation = 'idle';

  void _trySubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
      setState(() => _animation = 'success');
      Future.delayed(const Duration(milliseconds: 1500));
      widget.submitFn(_userEmail.trim(), _userPassword.trim(), _userName.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isError) setState(() => _animation = 'fail');
    return Center(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration: _decoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _flareActor(),
              _textFieldForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flareActor() => SizedBox(
        height: 180,
        width: 300,
        child: FlareActor(
          'assets/Teddy.flr',
          alignment: Alignment.bottomCenter,
          fit: BoxFit.contain,
          animation: _animation,
          callback: (_) => setState(() => _animation = 'idle'),
        ),
      );
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
              _emailTextField(),
              if (!_isLogin) _userNameTextField(),
              _passwordTextField(),
              _buttonloginSignup(context),
            ],
          ),
        ),
      );

  Widget _emailTextField() {
    return TextFormField(
      focusNode: _emailNode,
      key: const ValueKey('email'),
      decoration: const InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => _userEmail = value!,
      validator: (value) {
        if (value!.isEmpty || !value.contains('@')) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _userNameTextField() {
    return TextFormField(
      focusNode: _userNameNode,
      key: const ValueKey('username'),
      decoration: const InputDecoration(labelText: 'Username'),
      onSaved: (value) => _userName = value!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter atleast 4 characters';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      focusNode: _passwordNode,
      key: const ValueKey('password'),
      decoration: const InputDecoration(labelText: 'Password'),
      style: const TextStyle(color: Colors.white),
      obscureText: true,
      onSaved: (value) => _userPassword = value!,
      validator: (value) {
        if (value!.isEmpty || value.length <= 5) {
          return 'Please enter atleast 4 characters';
        }
        return null;
      },
    );
  }

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
      setState(() => _animation = s1);
    } else {
      setState(() => _animation = s2);
    }
  }

  final _decoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFF033D49),
        Color(0xFF104F55),
        Color(0xFF155C60),
        Color(0xFF186568),
        Color(0xFF1B6F72),
        Color(0xFF1F787A),
      ],
    ),
  );
}
