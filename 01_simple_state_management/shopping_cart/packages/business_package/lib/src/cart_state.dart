import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:model_package/model_package.dart';

@injectable
class CartState with ChangeNotifier {
  final Map<Product, int> _products = {};

  Map<Product, int> get products => _products;

  int get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);

  void add(Product product) {
    if (_products.containsKey(product)) {
      _products[product] = _products[product]! + 1;
    } else {
      _products[product] = 1;
    }
    notifyListeners();
  }

  void remove(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] = _products[product]! - 1;
    }
    notifyListeners();
  }
}
