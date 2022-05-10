import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/screens/auth_and_admin/admin_panel_screen.dart';
import 'package:shop_app2/screens/users_screen/home_screen.dart';
import 'package:shop_app2/widgets/admin_widgets/auth_widgets/auth_form.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({Key? key, required this.pageKey}) : super(key: key);
  final String pageKey;
  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  String message = 'An error occured, please check ur credentials';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: _decoration,
      child: AuthForm(submitFn: _submitFn, isLoading: _isLoading),
    );
  }

  void _submitFn(String email, String password, String userName, bool isLogin,
      BuildContext ctx) async {
    setState(() => _isLoading = true);
    UserCredential _user;
    try {
      if (isLogin) {
        _user = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        _user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
      // seperating Admin Users
      Provider.of<Category>(context, listen: false).setUserId(_user.user!.uid);
      if (email.contains('30jb40') && widget.pageKey == 'admin') {
        Navigator.of(ctx).pushNamed(AdminPanelScreen.routeName);
      } else if (widget.pageKey == 'admin') {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
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

  final _decoration = BoxDecoration(
    gradient: LinearGradient(colors: [
      AppColors.secondary.withOpacity(0.5),
      AppColors.secondary.withOpacity(0.2),
      AppColors.secondary.withOpacity(0.1)
    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
  );
}
