import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: CircleAvatar(
                radius: 24, backgroundImage: NetworkImage(item.imageUrl)),
          ),
          title: Text(item.title),
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
        ),
        Positioned(
          bottom: -10,
          right: 0,
          left: 40,
          child: InkWell(
              onTap: () => cartData.removeItem(item),
              child: const Icon(CupertinoIcons.delete)),
        ),
      ],
    );
  }

  final _decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.vertical(
        top: Radius.circular(35), bottom: Radius.circular(14)),
    boxShadow: [
      BoxShadow(
          color: const Color(0xFF3F6080).withOpacity(.2),
          offset: const Offset(4.0, 4.0),
          blurRadius: 15.0,
          spreadRadius: 3.0),
      const BoxShadow(
          color: Color(0xFFEBF3FE),
          offset: Offset(-4.0, -4.0),
          blurRadius: 15.0,
          spreadRadius: 1.0),
    ],
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF3F6080).withOpacity(.2),
        const Color(0xFFEBF3FE).withOpacity(0.4),
        const Color(0xFFEBF3FE).withOpacity(0.6),
        const Color(0xFFEBF3FE).withOpacity(0.8),
      ],
      stops: const [0.1, 0.3, 0.4, 1],
    ),
  );
}