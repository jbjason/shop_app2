import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context).items;
    return SafeArea(
      child: Scaffold(
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
    return SizedBox(
      height: 70,
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.grey[300],
          child: CircleAvatar(
            radius: 20,
            child: Image.network(widget.item.imageUrl, fit: BoxFit.cover),
          ),
        ),
        title: Text(widget.item.title),
        
        trailing: Column(children: [
          Text(widget.item.price.toString()),
          const Icon(Icons.abc,size: 15),
        ],),
      ),
    );
  }
}
