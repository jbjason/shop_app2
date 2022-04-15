import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/product.dart';

class CartItem {
  final String id, title, imageUrl;
  int quantity;
  final double price;
  final List<Color> colors;
  final List<String> sizes;
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.colors,
    required this.sizes,
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

  void addItem(Product product, Color _sColor, String _sSize) {
    final int i = getIndex(product.id);
    if (i == -1) {
      // putting the selected color & size at index 0
      product.color.remove(_sColor);
      product.color.insert(0, _sColor);
      product.size.remove(_sSize);
      product.size.insert(0, _sSize);
      _items.add(
        CartItem(
          id: product.id,
          title: product.title,
          imageUrl: product.imageUrl[0],
          price: product.price,
          colors: product.color,
          sizes: product.size,
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
