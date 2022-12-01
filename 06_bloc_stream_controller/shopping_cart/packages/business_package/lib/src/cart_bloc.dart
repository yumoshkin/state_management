import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:model_package/model_package.dart';

abstract class CartEvent {}

class AddCartEvent extends CartEvent {
  final Product product;
  AddCartEvent({required this.product});
}

class RemoveCartEvent extends CartEvent {
  final Product product;
  RemoveCartEvent({required this.product});
}

@injectable
class CartBloc {
  final Map<Product, int> _products = {};

  Map<Product, int> get products => _products;

  final _eventController = StreamController<CartEvent>();
  final _stateController = StreamController<Map<Product, int>>.broadcast();

  Sink<CartEvent> get event => _eventController.sink;
  Stream<Map<Product, int>> get state => _stateController.stream;

  CartBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(dynamic event) {
    var product = event.product;

    if (event is AddCartEvent) {
      if (_products.containsKey(product)) {
        _products[product] = _products[product]! + 1;
      } else {
        _products[product] = 1;
      }
    } else if (event is RemoveCartEvent) {
      if (_products.containsKey(product) && _products[product] == 1) {
        _products.removeWhere((key, value) => key == product);
      } else {
        _products[product] = _products[product]! - 1;
      }
    }

    _stateController.add(_products);
  }

  int get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
