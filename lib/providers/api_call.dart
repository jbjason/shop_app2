import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shop_app2/providers/product.dart';
import 'package:http/http.dart' as http;

final errorProduct = Product(
  id: 'error',
  title: 'error',
  subtitle: 'error',
  description: 'error',
  category: 'error',
  price: 0,
  imageUrl: [],
  color: [],
  size: [],
);

Future<Product> addProductAPI(Product product) async {
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
    return Product(
      title: product.title,
      subtitle: product.subtitle,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: json.decode(response.body)['name'],
      color: product.color,
      size: product.size,
      category: product.category,
    );
  } catch (e) {
    print('add $e');
    return errorProduct;
  }
}

Future<List<Product>> fetchProductsAPI() async {
  final url = Uri.parse(
      "https://shop-2-5c421-default-rtdb.asia-southeast1.firebasedatabase.app/products.json");
  final List<Product> _fetchList = [];
  try {
    final response = await http.get(url);
    final _data = json.decode(response.body);
    if (_data != null) {
      final extractedData = _data as Map<String, dynamic>;
      extractedData.forEach((proId, prodData) {
        _fetchList.add(Product(
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
    }
    return _fetchList;
  } catch (e) {
    print('fetch prb $e');
    return _fetchList;
  }
}
