import 'package:flutter/cupertino.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';

class Category with ChangeNotifier {
  List<Product> _categoryList = [];

  List<Product> get categoryList => [..._categoryList];

  void setCategorizedList(List<Product> items, double range, int index) {
    if (index == 0) {
      _categoryList = [...items];
    } else {
      _categoryList = [];
      _categoryList = items
          .where((element) =>
              element.category == categories[index] && element.price <= range)
          .toList();
    }
    notifyListeners();
  }
}
