import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_welcome.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/screens/admin_screen/admin_panel_screen.dart';
import 'package:shop_app2/screens/users_screen/home_screen.dart';
import 'package:shop_app2/widgets/auth_widgets/auth_form.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({Key? key, required this.pageKey}) : super(key: key);
  final String pageKey;

  @override
  Widget build(BuildContext context) {
    final _isLoading = ValueNotifier<bool>(false);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      decoration: authDecoration,
      child: AuthForm(submitFn: _submitFn, isLoading: _isLoading),
    );
  }

  void _submitFn(String email, String password, String userName, bool isLogin,
      BuildContext ctx, ValueNotifier<bool> isLoad) async {
    isLoad.value = true;
    final _auth = FirebaseAuth.instance;
    String message = 'An error occured, please check ur credentials';
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
      Provider.of<Category>(ctx, listen: false).setUserId(_user.user!.uid);
      if (email.contains('jb') && pageKey == 'admin') {
        Navigator.of(ctx).pushNamed(AdminPanelScreen.routeName);
      } else if (pageKey == 'admin') {
        Navigator.of(ctx).pushNamed(HomeScreen.routeName);
      } else {
        Navigator.pop(ctx);
      }
    } on PlatformException catch (err) {
      if (err.message != null) {
        message = err.message!;
      }
      setErrorMessage(ctx, message, isLoad);
    } catch (e) {
      setErrorMessage(ctx, message, isLoad);
    }
  }

  void setErrorMessage(
      BuildContext ctx, String msg, ValueNotifier<bool> isLoad) {
    isLoad.value = false;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.redAccent),
    );
  }
}
