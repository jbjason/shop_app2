import 'package:flutter/material.dart';
import 'package:shop_app2/widgets/admin_widgets/edit_widgets/edit_body.dart';

class EditProductScreen extends StatelessWidget {
  static const routeName = '/edit-product-screen';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _argument = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: EditBody(isEdit: _argument),
        ),
      ),
    );
  }
}
