import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/screens/admin_screen/edit_product_screen.dart';
import 'package:shop_app2/widgets/admin_widgets/admin_panel_widgets/admin_product_item.dart';

class AdminPanelScreen extends StatelessWidget {
  static const routeName = '/admin-panel-screen';
  const AdminPanelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _logoutButton(context),
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .pushNamed(EditProductScreen.routeName, arguments: ''),
                    child: const Icon(CupertinoIcons.add),
                  )
                ],
              ),
            ),
            Expanded(
              child: Consumer<Products>(
                builder: (ctx, productData, _) => ListView.builder(
                  itemBuilder: (_, i) =>
                      AdminProductItem(product: productData.items[i]),
                  itemCount: productData.items.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoutButton(BuildContext context) => SizedBox(
        height: 40,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Provider.of<Category>(context, listen: false).setUserId('');
                int count = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 2;
                });
              },
            ),
            const SizedBox(width: 10),
            const Text('Admin Panel',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis))
          ],
        ),
      );
}
