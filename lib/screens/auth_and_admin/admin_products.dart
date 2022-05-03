import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/widgets/admin_widgets/admin_product_item.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<Products>(
          builder: (ctx, productData, _) => ListView.builder(
            itemBuilder: (_, i) => Column(
              children: [
                AdminProductItem(
                  id: productData.items[i].id,
                  title: productData.items[i].title,
                  imageUrl: productData.items[i].imageUrl,
                ),
              ],
            ),
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
