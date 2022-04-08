import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/orders.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ordersList = Provider.of<Orders>(context).orders;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _backButtonTitle(context),
            Expanded(child: _cartList(_ordersList)),
          ],
        ),
      ),
    );
  }

  Widget _backButtonTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 60,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 10),
          const Text('Your Orders',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _cartList(List<OrderItem> ordersList) {
    return ordersList.isNotEmpty
        ? ListView.builder(
            itemCount: ordersList.length,
            itemBuilder: (context, i) {
              return OrderSingleItem(order: ordersList[i]);
            },
          )
        : const Center(
            child: Text('No items Available right now !'),
          );
  }
}

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
          _expanded ? min(widget.order.products.length * 20.0 + 110, 200) : 95,
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title:
                  Text('Total =  \$${widget.order.amount.toStringAsFixed(2)}'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy    hh:mm').format(widget.order.dateTime),
              ),
              trailing: IconButton(
                  icon: Icon(_expanded
                      ? CupertinoIcons.rectangle_expand_vertical
                      : CupertinoIcons.rectangle_compress_vertical),
                  onPressed: () => setState(() => _expanded = !_expanded)),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: _expanded
                  ? min(widget.order.products.length * 20.0 + 10, 100)
                  : 0,
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          children: [
                            Text(
                              prod.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              '${prod.quantity}x  \$${prod.price}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
