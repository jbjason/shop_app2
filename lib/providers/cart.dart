import 'package:flutter/cupertino.dart';

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
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount => _items.length;

  double get totalAmount {
    double a = 0.0;
    _items.forEach((key, value) {
      a += value.price * value.quantity;
    });
    return a;
  }

  void addItem(String productId, double price, String imageUrl, String title,
      String keyId, int quan) {
    // keyID == 2 means req from productDetailsScreen
    // keyID == 1 means req from productOverviewScreen & which have to be ignore cz this item already in cart.
    if (_items.containsKey(productId) && keyId == 2.toString()) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          imageUrl: existingItem.imageUrl,
          price: existingItem.price,
          quantity: quan,
        ),
      );
    } else if (_items.containsKey(productId) && keyId == 1.toString()) {
      return;
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          imageUrl: imageUrl,
          price: price,
          quantity: quan,
        ),
      );
    }
    notifyListeners();
  }

  void update(String productId, int quan) {
    _items.update(
      productId,
      (existingItem) => CartItem(
        id: existingItem.id,
        title: existingItem.title,
        imageUrl: existingItem.imageUrl,
        price: existingItem.price,
        quantity: quan,
      ),
    );
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String proId) {
    if (!_items.containsKey(proId)) return;
    if (_items[proId]!.quantity > 1) {
      _items.update(
          proId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              imageUrl: value.imageUrl,
              quantity: value.quantity - 1,
              price: value.price));
    } else {
      _items.remove(proId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
