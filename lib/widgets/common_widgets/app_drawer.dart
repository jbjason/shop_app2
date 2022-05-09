import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app2/screens/auth_and_admin/admin_panel_screen.dart';
import 'package:shop_app2/screens/auth_and_admin/auth_screen.dart';
import 'package:shop_app2/screens/users_screen/offers_screen.dart';
import 'package:shop_app2/screens/users_screen/order_screen.dart';
import 'package:shop_app2/screens/users_screen/sort_by_screen.dart';

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
              final _user = FirebaseAuth.instance.currentUser;
              if (_user != null) {
                Navigator.of(context)
                    .pushNamed(OrderScreen.routeName, arguments: _user.uid);
              } else {
                Navigator.of(context).pushNamed(AuthScreen.routeName);
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Offers'),
            onTap: () =>
                Navigator.of(context).pushNamed(OffersScreen.routeName),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Sort By'),
            onTap: () =>
                Navigator.of(context).pushNamed(SortByScreen.routeName),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Auth Screen'),
            onTap: () => Navigator.of(context)
                .pushNamed(AuthScreen.routeName, arguments: 'home'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Admin Panel'),
            onTap: () =>
                Navigator.of(context).pushNamed(AdminPanelScreen.routeName),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
