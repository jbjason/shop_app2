import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id, title, description, category, subtitle;
  final double price;
  final List<String> imageUrl;
  final List<String> size;
  final List<Color> color;
  double isRating;
  int isReview;
  bool isFavorite;
  Product({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.size,
    this.isFavorite = false,
    this.isRating = 5.0,
    this.isReview = 10,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
