import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
