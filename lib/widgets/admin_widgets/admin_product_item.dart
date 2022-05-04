import 'package:flutter/material.dart';
import 'package:shop_app2/providers/product.dart';

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
        width: 110,
        child: Row(
          children: [
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(Icons.edit),
              onPressed: () {
                //     Navigator.of(context)
                //         .pushNamed(EditProductScreen.routeName, arguments: id);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () async {
                try {
                  // await Provider.of<Products>(context, listen: false)
                  //     .deleteProduct(id);
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
