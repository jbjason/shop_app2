import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/orders.dart';
import 'package:shop_app2/widgets/user_widgets/orders_widget/order_singleitem.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ordersList = Provider.of<Orders>(context).orders;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              getAppBarTile('Your Orders', context),
              Expanded(child: _cartList(_ordersList)),
            ],
          ),
        ),
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
