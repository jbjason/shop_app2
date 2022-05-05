import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/screens/auth_and_admin/edit_product_screen.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.title,
          style: const TextStyle(overflow: TextOverflow.ellipsis)),
      subtitle: Text('category: ${product.category}'),
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl[0])),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: AppColors.accent),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName,
                    arguments: product.id);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: AppColors.secondary),
              onPressed: () {
                try {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Alert !'),
                      content: const Text('Do you want to remove the item?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Provider.of<Products>(context, listen: false)
                                .deleteProduct(product.id);
                            Navigator.pop(context, true);
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('No'),
                        ),
                      ],
                    ),
                  );
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Deleting Failed')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
