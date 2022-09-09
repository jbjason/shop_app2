import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/product.dart';

class Category with ChangeNotifier {
  List<Product> _items = [];
  void update(List<Product> items) => _items = [...items];

  List<Product> _allProducts = [];
  List<Product> get allProducts => [..._allProducts];

  void setAllProducts(String category) {
    if (category == "All") {
      _allProducts = _items;
    } else {
      _allProducts =
          _items.where((element) => element.category == category).toList();
    }
    notifyListeners();
  }

  String _userid = '';
  String get userid => _userid;

  void setUserId(String s) {
    _userid = s;
    notifyListeners();
  }
}
