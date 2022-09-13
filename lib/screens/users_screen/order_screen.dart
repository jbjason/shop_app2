import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/constants_others.dart';
import 'package:shop_app2/providers/orders.dart';
import 'package:shop_app2/widgets/user_widgets/orders_widget/order_singleitem.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/order-screen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userId = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/cart_.png'), fit: BoxFit.contain)),
          child: Column(
            children: [
              getAppBarTile('Your Orders', context),
              const SizedBox(height: 20),
              Expanded(child: _orderBody(context, _userId)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderBody(BuildContext context, String userId) => FutureBuilder(
        future: Provider.of<Orders>(context, listen: false)
            .fetchAndSetOrders(userId),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // if an error occurs
            if (dataSnapshot.error != null) {
              return const Center(child: Text('An error occured'));
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, _) => orderData.orders.isEmpty
                    ? const Center(
                        child: Text('No Orders Have Done yet!'),
                      )
                    : _orderList(orderData.orders),
              );
            }
          }
        },
      );

  Widget _orderList(List<OrderItem> ordersList) {
    return ordersList.isNotEmpty
        ? ListView.builder(
            itemCount: ordersList.length,
            itemBuilder: (context, i) {
              return OrderSingleItem(order: ordersList[i]);
            },
          )
        : const Center(
            child: Text('No Order has done yet .add one!'),
          );
  }
}
