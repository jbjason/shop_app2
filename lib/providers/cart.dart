import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/product.dart';

class CartItem {
  final String id, title, imageUrl;
  final int quantity;
  final double price;
  const CartItem({
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

  int get itemCount => _items.length;

  double get totalAmount {
    double a = 0.0;
    for (var cart in _items) {
      a += cart.price * cart.quantity;
    }
    return a;
  }

  void addItem(Product product) {
    final int i = _items.indexWhere((element) => element.id == product.id);
    if (i == -1) {
      _items.add(
        CartItem(
          id: product.id,
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void update(String productId, int quan) {
    // _items.update(
    //   productId,
    //   (existingItem) => CartItem(
    //     id: existingItem.id,
    //     title: existingItem.title,
    //     imageUrl: existingItem.imageUrl,
    //     price: existingItem.price,
    //     quantity: quan,
    //   ),
    // );
    notifyListeners();
  }

  void removeItem(String productId) {
    // _items.remove(productId);
    // notifyListeners();
  }

  void removeSingleItem(String proId) {
    // if (!_items.containsKey(proId)) return;
    // if (_items[proId]!.quantity > 1) {
    //   _items.update(
    //       proId,
    //       (value) => CartItem(
    //           id: value.id,
    //           title: value.title,
    //           imageUrl: value.imageUrl,
    //           quantity: value.quantity - 1,
    //           price: value.price));
    // } else {
    //   _items.remove(proId);
    // }
    // notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}
