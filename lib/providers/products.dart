import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/51c%2BT7XynwL._AC_UX679_.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trowser',
      description: 'this is a pan for helping home chores',
      price: 20.45,
      imageUrl:
          'https://i.pinimg.com/474x/e4/ed/45/e4ed45ddf937abb7c3862469a15372c8.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'this is a pan for helping home chores',
      price: 20.45,
      imageUrl:
          'https://www.grandrivershotokan.ca/wp-content/uploads/2018/12/1029.40.png',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'this is a pan for helping home chores',
      price: 20.45,
      imageUrl:
          'https://static01.nyt.com/images/2011/01/26/business/pan2/pan2-blog480.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: product.id,
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void deleteProduct(String id) {
    final exIndex = _items.indexWhere((element) => element.id == id);
    _items.removeAt(exIndex);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((element) => element.id == id);
    _items[prodIndex] = newProduct;
    notifyListeners();
  }
}
