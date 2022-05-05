import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/screens/auth_and_admin/edit_product_screen.dart';
import 'package:shop_app2/widgets/admin_widgets/admin_widgets/admin_product_item.dart';

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
                  getAppBarTile('Admin Panel', context),
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
}
