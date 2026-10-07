import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/user.dart';

class AppState extends ChangeNotifier {
  final List<Product> _products = [
    Product(id: '1', title: 'Flutter Headphones', price: 99.99, imageUrl: 'https://picsum.photos/200'),
    Product(id: '2', title: 'Dart Smartwatch', price: 149.99, imageUrl: 'https://picsum.photos/201'),
  ];
  
  final User _currentUser = User(
    id: 'u1',
    name: 'Олександр Петренко',
    email: 'alex.petrenko@example.com',
    avatarUrl: 'https://i.pravatar.cc/150?img=12',
  );

  int _cartCount = 0;

  List<Product> get products => _products;
  User get currentUser => _currentUser;
  int get cartCount => _cartCount;

  void toggleFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  void addToCart(Product product) {
    _cartCount++;
    notifyListeners();
  }
}
