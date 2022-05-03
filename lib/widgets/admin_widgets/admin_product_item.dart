import 'package:flutter/material.dart';

class AdminProductItem extends StatelessWidget {
  const AdminProductItem(
      {Key? key, required this.title, required this.id, required this.imageUrl})
      : super(key: key);
  final String title, id;
  final List<String> imageUrl;
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
          Text(title, style: const TextStyle(overflow: TextOverflow.ellipsis)),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl[0])),
      trailing: SizedBox(
        width: 100,
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
                      const SnackBar(content: Text('Deleteing Failed')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
