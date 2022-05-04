import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/admin_widgets/admin_product_item.dart';

class AdminPanelScreen extends StatelessWidget {
  static const routeName = '/admin-panel-screen';
  const AdminPanelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getAppBarTile('Admin Panel', context),
                InkWell(
                  onTap: () {},
                  child: const Icon(CupertinoIcons.add),
                )
              ],
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
