import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/product.dart';

class CartItem {
  final String id, title, imageUrl;
  int quantity;
  final double price;
  Color color;
  String size;
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.size,
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

  String addItem(Product product, int _sColorIndex, int _sSize) {
    final int i = getIndex(product.id);
    if (i == -1) {
      // putting the selected color & size at index 0
      List<Color> _colors = product.color;
      List<String> _sizes = product.size;
      if (_sColorIndex != 0) {
        _colors.removeAt(_sColorIndex);
        _colors.insert(0, product.color[_sColorIndex]);
        _sizes.removeAt(_sSize);
        _sizes.insert(0, product.size[_sSize]);
      }
      _items.add(
        CartItem(
          id: product.id,
          title: product.title,
          imageUrl: product.imageUrl[0],
          price: product.price,
          color: _colors[0],
          size: _sizes[0],
          quantity: 1,
        ),
      );
      notifyListeners();
      return 'Added item to Cart!';
    } else {
      return 'Item already in Cart !';
    }
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
