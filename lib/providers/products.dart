import 'package:flutter/cupertino.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/constants_2.dart';
import 'package:shop_app2/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: DateTime.now().toString(),
      title: 'Red Shirt',
      description: detailString,
      price: 29.99,
      imageUrl: imageList1,
      size: sizeList,
      color: colorsList,
      category: categories[1],
    ),
    Product(
      id: DateTime.january.toString(),
      title: 'Trowser',
      description: detailString,
      price: 20.45,
      imageUrl: imageList2,
      size: sizeList,
      color: colorsList,
      category: categories[1],
    ),
    Product(
      id: DateTime.february.toString(),
      title: 'Yellow Scarf',
      description: detailString,
      price: 20.45,
      imageUrl: imageList3,
      size: sizeList,
      color: colorsList,
      category: categories[2],
    ),
    Product(
      id: DateTime.march.toString(),
      title: 'A Pan',
      description: detailString,
      price: 20.45,
      imageUrl: imageList4,
      size: sizeList,
      color: colorsList,
      category: categories[2],
    ),
    Product(
      id: DateTime.april.toString(),
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: imageList1,
      size: sizeList,
      color: colorsList,
      category: categories[3],
    ),
    Product(
      id: DateTime.may.toString(),
      title: 'Trowser',
      description: detailString,
      price: 20.45,
      imageUrl: imageList2,
      size: sizeList,
      color: colorsList,
      category: categories[3],
    ),
    Product(
      id: DateTime.june.toString(),
      title: 'Yellow Scarf',
      description: detailString,
      price: 20.45,
      imageUrl: imageList3,
      size: sizeList,
      color: colorsList,
      category: categories[4],
    ),
    Product(
      id: DateTime.july.toString(),
      title: 'A Pan',
      description: detailString,
      price: 20.45,
      imageUrl: imageList4,
      size: sizeList,
      color: colorsList,
      category: categories[4],
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
      color: product.color,
      size: product.size,
      category: product.category,
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void deleteProduct(String id) {
    final exIndex = _items.indexWhere((element) => element.id == id);
    _items.removeAt(exIndex);
    notifyListeners();
  }

  void updateProduct(Product newProduct) {
    final prodIndex =
        _items.indexWhere((element) => element.id == newProduct.id);
    _items[prodIndex] = newProduct;
    notifyListeners();
  }
}
