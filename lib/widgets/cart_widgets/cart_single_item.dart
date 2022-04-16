import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/cart.dart';

class CartSingleItem extends StatelessWidget {
  CartSingleItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final CartItem item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      height: 80,
      decoration: _decoration,
      child: _cartBody(context),
    );
  }

  Widget _cartBody(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(item.id),
      background: Container(
        child: const Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).errorColor),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Alert !'),
            content: const Text('Do you want to remove the item?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) => cartData.removeItem(item),
      child: _cartItem(cartData),
    );
  }

  Widget _cartItem(Cart cartData) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[300],
        child: CircleAvatar(
            radius: 24, backgroundImage: NetworkImage(item.imageUrl)),
      ),
      title: Text(item.title),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item.colors[0],
            ),
          ),
          const SizedBox(width: 10),
          Text(item.sizes[0]),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('\$ ${item.price}'),
          const SizedBox(height: 5),
          SizedBox(
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    if (item.quantity != 1) {
                      cartData.update(item, 'm');
                    }
                  },
                  child: const Icon(CupertinoIcons.minus_circle, size: 20),
                ),
                Text('${item.quantity < 10 ? 0 : ''}${item.quantity}'),
                InkWell(
                  onTap: () => cartData.update(item, 'plus'),
                  child: const Icon(CupertinoIcons.plus_circle, size: 20),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  final _decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.vertical(
        top: Radius.circular(35), bottom: Radius.circular(14)),
    boxShadow: getShadowBox(Colors.grey.shade600, Colors.white),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF6b705c).withOpacity(.2),
        const Color(0xFFa5a58d).withOpacity(0.2),
        const Color(0xFFa5a58d).withOpacity(0.4),
        const Color(0xFFb7b7a4).withOpacity(0.2),
      ],
      stops: const [0.1, 0.3, 0.4, 1],
    ),
  );
}
