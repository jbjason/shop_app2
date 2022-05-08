import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/screens/auth_and_admin/admin_panel_screen.dart';
import 'package:shop_app2/screens/users_screen/home_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(submitFn: _submitAuthForm, isLoading: _isLoading),
    );
  }

  void _submitAuthForm(String email, String password, String userName,
      bool isLogin, BuildContext ctx) async {
    String message = 'An error occured, please check ur credentials';
    UserCredential _authResult;
    setState(() => _isLoading = true);
    try {
      if (isLogin) {
        _authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        _authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
      // setting userInfo & navigating to another page
      Provider.of<Category>(ctx, listen: false)
          .setUsersInfo(email, _authResult.user!.uid);
      print(_authResult.user!.uid);
      print(email);
      if (email.contains('30jb40')) {
        Navigator.of(ctx).pushNamed(AdminPanelScreen.routeName);
      } else {
        Navigator.of(ctx).pushNamed(HomeScreen.routeName);
      }
    } on PlatformException catch (err) {
      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
            content: Text(message), backgroundColor: Theme.of(ctx).errorColor),
      );
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
            content: Text(message), backgroundColor: Theme.of(ctx).errorColor),
      );
    }
  }
}
