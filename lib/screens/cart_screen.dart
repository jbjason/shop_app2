import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context).items;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: ((context, i) =>
                      CartSingleItem(item: cartItems[i], index: i)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartSingleItem extends StatefulWidget {
  const CartSingleItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final CartItem item;
  final int index;
  @override
  State<CartSingleItem> createState() => _CartSingleItemState();
}

class _CartSingleItemState extends State<CartSingleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 20),
      height: 80,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(widget.item.imageUrl),
          ),
        ),
        title: Text(widget.item.title),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.item.price.toString()),
            const Icon(Icons.badge, size: 15),
          ],
        ),
      ),
    );
  }
}
