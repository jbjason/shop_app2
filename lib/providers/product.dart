import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id, title, description;
  final double price;
  final List<String> imageUrl ;
  double isRating;
  int isReview;
  bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.isRating = 5.0,
    this.isReview = 10,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
