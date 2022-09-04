import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/constants/theme.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:shop_app2/providers/category.dart';
import 'package:shop_app2/providers/orders.dart';
import 'package:shop_app2/providers/products.dart';
import 'package:shop_app2/screens/auth_and_admin/admin_panel_screen.dart';
import 'package:shop_app2/screens/auth_and_admin/auth_screen.dart';
import 'package:shop_app2/screens/auth_and_admin/edit_product_screen.dart';
import 'package:shop_app2/screens/users_screen/cart_screen.dart';
import 'package:shop_app2/screens/users_screen/confirm_screen.dart';
import 'package:shop_app2/screens/users_screen/details_screen.dart';
import 'package:shop_app2/screens/users_screen/home_screen.dart';
import 'package:shop_app2/screens/users_screen/offers_screen.dart';
import 'package:shop_app2/screens/users_screen/order_screen.dart';
import 'package:shop_app2/screens/users_screen/sort_by_screen.dart';
import 'package:shop_app2/screens/users_screen/thanks_screen.dart';
import 'package:shop_app2/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProxyProvider<Products, Category>(
          create: (context) => Category(),
          update: (_, products, previous) => previous!..update(products.items),
        ),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: AppTheme.light(),
        themeMode: ThemeMode.light,
        home: WelcomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen(),
          DetailsScreen.routeName: (ctx) => const DetailsScreen(),
          OffersScreen.routeName: (ctx) => const OffersScreen(),
          SortByScreen.routeName: (ctx) => const SortByScreen(),
          AuthScreen.routeName: (ctx) => const AuthScreen(),
          ThanksScreen.routeName: (ctx) => const ThanksScreen(),
          ConfirmScreen.routeName: (ctx) => const ConfirmScreen(),
          AdminPanelScreen.routeName: (ctx) => const AdminPanelScreen(),
          EditProductScreen.routeName: (ctx) => const EditProductScreen(),
        },
      ),
    );
  }
}
