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
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders(String userId) async {
    final url = Uri.parse(
        "https://flutter-update-67f54.firebaseio.com/orders/$userId.json");
    final response = await http.get(url);
    final _data = json.decode(response.body);
    if (_data != null) {
      final extractedData = _data as Map<String, dynamic>;
      final List<OrderItem> loadedOrders = [];
      extractedData.forEach((orderId, orderData) {
        loadedOrders.add(OrderItem(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map((item) => CartItem(
                    id: item['id'],
                    title: item['title'],
                    imageUrl: item['imageUrl'],
                    quantity: item['quantity'],
                    price: item['price'],
                    size: item['size'],
                    color: Color(int.parse(item['color'])),
                  ))
              .toList(),
        ));
      });
      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    }
  }

  Future<void> addOrder(
      List<CartItem> cartProducts, double total, String _id) async {
    final timeStop = DateTime.now();
    final url = Uri.parse(
        "https://shop-2-5c421-default-rtdb.asia-southeast1.firebasedatabase.app/orders/$_id.json");
    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'dateTime': timeStop.toIso8601String(),
            'products': cartProducts
                .map(
                  (cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                    'size': cp.size,
                    'color': cp.color.value.toString(),
                  },
                )
                .toList(),
          }));
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
