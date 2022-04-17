import 'package:flutter/material.dart';
import 'package:shop_app2/screens/offers_screen.dart';
import 'package:shop_app2/screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      width: 250,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('My Orders'),
            onTap: () {
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Available Offers'),
            onTap: () {
              Navigator.of(context).pushNamed(OffersScreen.routeName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
