import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  const OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(
      List<CartItem> cartProducts, double total, String _id) async {
    final timeStop = DateTime.now();
    final url = Uri.parse(
        "https://shop-2-5c421-default-rtdb.asia-southeast1.firebasedatabase.app/orders/$_id.json");
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'amount': total,
          'dateTime': timeStop.toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
        }),
      );
      _orders.insert(
        0,
        OrderItem(
            id: json.decode(response.body)['name'],
            amount: total,
            products: cartProducts,
            dateTime: timeStop),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
