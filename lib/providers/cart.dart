import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/product.dart';

class CartItem {
  final String id, title, imageUrl;
  int quantity;
  final double price;
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items {
    return [..._items];
  }

  double get totalAmount {
    double a = 0.0;
    for (var cart in _items) {
      a += cart.price * cart.quantity;
    }
    return a;
  }

  int get itemCount => _items.length;

  int getIndex(String id) => _items.indexWhere((element) => element.id == id);

  void addItem(Product product) {
    final int i = getIndex(product.id);
    if (i == -1) {
      _items.add(
        CartItem(
          id: product.id,
          title: product.title,
          imageUrl: product.imageUrl[0],
          price: product.price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void update(CartItem cart, String s) {
    final f = getIndex(cart.id);
    if (s == 'plus') {
      _items[f].quantity += 1;
    } else {
      _items[f].quantity -= 1;
    }
    notifyListeners();
  }

  void removeItem(CartItem product) {
    _items.remove(product);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}
