import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app2/providers/orders.dart';

class OrderSingleItem extends StatefulWidget {
  const OrderSingleItem({Key? key, required this.order}) : super(key: key);
  final OrderItem order;
  @override
  State<OrderSingleItem> createState() => _OrderSingleItemState();
}

class _OrderSingleItemState extends State<OrderSingleItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height:
          _expanded ? min(widget.order.products.length * 25.0 + 110, 230) : 95,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            _ordersReceipt(),
            _ordersDetails(),
          ],
        ),
      ),
    );
  }

  Widget _ordersReceipt() {
    return ListTile(
      title: Text('Total =  \$${widget.order.amount.toStringAsFixed(2)}'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy    hh:mm').format(widget.order.dateTime),
      ),
      trailing: IconButton(
          icon: Icon(_expanded
              ? CupertinoIcons.rectangle_expand_vertical
              : CupertinoIcons.rectangle_compress_vertical),
          onPressed: () => setState(() => _expanded = !_expanded)),
    );
  }

  Widget _ordersDetails() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height:
          _expanded ? min(widget.order.products.length * 25.0 + 10, 150) : 0,
      child: ListView(
        children: widget.order.products
            .map((prod) => Row(
                  children: [
                    Text(
                      prod.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '${prod.quantity}x  \$${prod.price}',
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
