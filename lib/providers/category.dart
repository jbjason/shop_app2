import 'package:flutter/cupertino.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';

class Category with ChangeNotifier {
  List<Product> _items = [];
  void update(List<Product> items) => _items = [...items];

  List<Product> _categoryList = [];
  List<Product> get categoryList => [..._categoryList];

  void setCategoryList() => _categoryList = [..._items];

  void updateCategoryList(int i) {
    if (i == 0) {
      _categoryList = [..._items];
    } else {
      _categoryList =
          _items.where((element) => element.category == categories[i]).toList();
    }
    notifyListeners();
  }

  int _isSet = 0;
  List<Product> getSortedList(double range) {
    if (_isSet == 0) {
      return [..._items];
    } else {
      return _items
          .where((element) =>
              element.category == categories[_isSet] && element.price <= range)
          .toList();
    }
  }

  void updateSortedList(int i) => _isSet = i;

  String userEmail = '', userId = '';

  void setUsersInfo(String email, String id) {
    userEmail = email;
    userId = id;
    notifyListeners();
  }
}
