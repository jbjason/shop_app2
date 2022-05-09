import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app2/screens/auth_and_admin/admin_panel_screen.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  String message = 'An error occured, please check ur credentials';

  @override
  Widget build(BuildContext context) {
    final _pageKey = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: AuthForm(
          submitFn: _submitAuthForm, isLoading: _isLoading, pageKey: _pageKey),
    );
  }

  void _submitAuthForm(String email, String password, String userName,
      bool isLogin, BuildContext ctx, String pageKey) async {
    setState(() => _isLoading = true);
    try {
      if (isLogin) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
      // seperating Admin Users
      if (email.contains('30jb40') && pageKey == 'admin') {
        Navigator.of(ctx).pushNamed(AdminPanelScreen.routeName);
      } else {
        Navigator.pop(ctx);
      }
    } on PlatformException catch (err) {
      if (err.message != null) {
        message = err.message!;
      }
      setErrorMessage(ctx);
    } catch (e) {
      setErrorMessage(ctx);
    }
  }

  void setErrorMessage(BuildContext ctx) {
    setState(() => _isLoading = false);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
    );
  }
}
