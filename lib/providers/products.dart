import 'package:flutter/cupertino.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/constants_welcome.dart';
import 'package:shop_app2/providers/api_call.dart';
import 'package:shop_app2/providers/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: DateTime.now().toString(),
      title: 'Red Shirt',
      subtitle: 'লাল শার্ট',
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
      subtitle: 'ট্রাউজার',
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
      subtitle: 'হলুদ স্কার্ফ',
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
      subtitle: 'কড়াই',
      description: detailString,
      price: 20.45,
      imageUrl: imageList4,
      size: sizeList,
      color: colorsList,
      category: categories[2],
    ),
    Product(
      id: DateTime.april.toString(),
      title: 'Samsung S9',
      subtitle: 'স্যামসাং S9',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: imageList1,
      size: sizeList,
      color: colorsList,
      category: categories[3],
    ),
    Product(
      id: DateTime.may.toString(),
      title: 'iPhone 7',
      subtitle: 'আইফোন 7',
      description: detailString,
      price: 20.45,
      imageUrl: imageList2,
      size: sizeList,
      color: colorsList,
      category: categories[3],
    ),
    Product(
      id: DateTime.june.toString(),
      title: 'Samsung M32',
      subtitle: 'স্যামসাং M32',
      description: detailString,
      price: 20.45,
      imageUrl: imageList3,
      size: sizeList,
      color: colorsList,
      category: categories[4],
    ),
    Product(
      id: DateTime.july.toString(),
      title: 'Oppo 3.0',
      subtitle: 'রেডমি 3.0',
      description: detailString,
      price: 20.45,
      imageUrl: imageList4,
      size: sizeList,
      color: colorsList,
      category: categories[4],
    ),
  ];

  List<Product> get items => [..._items];

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Future<void> addProduct(Product product) async {
    final response = await addProductAPI(product);
    if (response.id != "error" || response.title != "error") {
      _items.add(response);
      notifyListeners();
    }
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

  Future<void> fetchProducts() async {
    final _fetchList = await fetchProductsAPI();
    if (_fetchList.isNotEmpty) {
      _fetchList.map((pro) => _items.add(pro)).toList();
    }
  }
}
