import 'package:flutter/cupertino.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: imageList1,
      size: sizeList,
      color: colorsList,
    ),
    Product(
      id: 'p2',
      title: 'Trowser',
      description: detailString,
      price: 20.45,
      imageUrl: imageList2,
      size: sizeList,
      color: colorsList,
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: detailString,
      price: 20.45,
      imageUrl: imageList3,
      size: sizeList,
      color: colorsList,
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: detailString,
      price: 20.45,
      imageUrl: imageList4,
      size: sizeList,
      color: colorsList,
    ),
    Product(
      id: 'p5',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: imageList1,
      size: sizeList,
      color: colorsList,
    ),
    Product(
      id: 'p6',
      title: 'Trowser',
      description: detailString,
      price: 20.45,
      imageUrl: imageList2,
      size: sizeList,
      color: colorsList,
    ),
    Product(
      id: 'p7',
      title: 'Yellow Scarf',
      description: detailString,
      price: 20.45,
      imageUrl: imageList3,
      size: sizeList,
      color: colorsList,
    ),
    Product(
      id: 'p8',
      title: 'A Pan',
      description: detailString,
      price: 20.45,
      imageUrl: imageList4,
      size: sizeList,
      color: colorsList,
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

  List<Product> _categoryList=[];
  void setCategorizedList(double range, int index) {
    if (index == 0) {
      _categoryList = items;
    } else {
    }
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
