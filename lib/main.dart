import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/orders.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/screens/auth_screen.dart';
import 'package:shop_app2/screens/cart_screen.dart';
import 'package:shop_app2/screens/details_screen.dart';
import 'package:shop_app2/screens/home_screen.dart';
import 'package:shop_app2/screens/offers_screen.dart';
import 'package:shop_app2/screens/order_screen.dart';
import 'package:shop_app2/screens/sort_by_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: AppTheme.light(),
        themeMode: ThemeMode.light,
        home: const HomeScreen(),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          DetailsScreen.routeName: (ctx) => const DetailsScreen(),
          OffersScreen.routeName: (ctx) => const OffersScreen(),
          SortByScreen.routeName: (ctx) => const SortByScreen(),
          AuthScreen.routeName: (ctx) => const AuthScreen(),
        },
      ),
    );
  }
}
