import 'package:flutter/cupertino.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';

class Category with ChangeNotifier {
  List<Product> _items = [];
  void update(List<Product> items) {
    _items = [...items];
  }

  List<Product> _categoryList = [];
  List<Product> get categoryList => [..._categoryList];

  void setCategoryList() {
    _categoryList = [..._items];
    notifyListeners();
  }

  void updateCategoryList(int i) {
    if (i == 0) {
      _categoryList = [..._items];
    } else {
      _categoryList =
          _items.where((element) => element.category == categories[i]).toList();
    }
    notifyListeners();
  }

  List<Product> _sortedList = [];
  List<Product> get sortedList => [..._sortedList];

  void setSortedList() {
    _sortedList = [..._items];
    notifyListeners();
  }

  void updateSortedList(int i) {
    if (i == 0) {
      _sortedList = [..._items];
    } else {
      _sortedList =
          _items.where((element) => element.category == categories[i]).toList();
    }
    notifyListeners();
  }
}
