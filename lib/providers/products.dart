import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shop_app2/constants/constants_.dart';
import 'package:shop_app2/constants/constants_2.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:http/http.dart' as http;

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
    final url = Uri.parse(
        "https://shop-2-5c421-default-rtdb.asia-southeast1.firebasedatabase.app/products.json");
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'subtitle': product.subtitle,
          'category': product.category,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl.map((e) => {'imageUrl1': e}).toList(),
          'color':
              product.color.map((e) => {'color1': e.value.toString()}).toList(),
          'size': product.size.map((e) => {'size1': e}).toList(),
        }),
      );
      _items.add(Product(
        title: product.title,
        subtitle: product.subtitle,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
        color: product.color,
        size: product.size,
        category: product.category,
      ));
      notifyListeners();
    } catch (e) {
      print(e);
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
    final url = Uri.parse(
        "https://shop-2-5c421-default-rtdb.asia-southeast1.firebasedatabase.app/products.json");
    try {
      final response = await http.get(url);
      final _data = json.decode(response.body);
      if (_data != null) {
        final extractedData = _data as Map<String, dynamic>;
        extractedData.forEach((proId, prodData) {
          _items.add(Product(
            id: proId,
            title: prodData['title'],
            subtitle: prodData['subtitle'],
            description: prodData['description'],
            price: prodData['price'],
            category: prodData['category'],
            imageUrl: (prodData['imageUrl'] as List<dynamic>)
                .map((e) => e['imageUrl1'].toString())
                .toList(),
            size: (prodData['size'] as List<dynamic>)
                .map((e) => e['size1'].toString())
                .toList(),
            color: (prodData['color'] as List<dynamic>)
                .map((e) => Color(int.parse(e['color1'])))
                .toList(),
          ));
        });
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }
}
