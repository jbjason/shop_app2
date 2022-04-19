import 'package:flutter/cupertino.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';

class Category with ChangeNotifier {
  List<Product> _categoryList = [];
  List<Product> get categoryList => _categoryList;

  void setCategoryList(int index, List<Product> products) {
    if (index == 0) {
      _sorteList = [...products];
    } else {
      _categoryList = products
          .where((element) => element.category == categories[index])
          .toList();
    }
    notifyListeners();
  }

  List<Product> _sorteList = [];
  List<Product> get sortedList => [..._sorteList];

  void setSortedList(List<Product> items, double range, int index) {
    if (index == 0) {
      _sorteList = [...items];
    } else {
      _sorteList = items
          .where((element) =>
              element.category == categories[index] && element.price <= range)
          .toList();
    }
    notifyListeners();
  }
}
