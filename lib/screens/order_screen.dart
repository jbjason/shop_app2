import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/orders.dart';
import 'package:shop_app2/widgets/orders_widget/order_singleitem.dart';

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
          getAppBarTile('Your Orders'),
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
