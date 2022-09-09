import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/product.dart';

class Category with ChangeNotifier {
  List<Product> _items = [];
  void update(List<Product> items) => _items = [...items];

  List<Product> _categoryList = [];
  List<Product> get categoryList => [..._categoryList];

  void setCategoryList() => _categoryList = [..._items];

  String _userid = '';
  String get userid => _userid;

  void setUserId(String s) {
    _userid = s;
    notifyListeners();
  }
}
