import 'package:injectable/injectable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:model_package/model_package.dart';

final stateProvider = StateNotifierProvider<CartState, Map<Product, int>>(
  (_) => CartState(),
);

@injectable
class CartState extends StateNotifier<Map<Product, int>> {
  CartState() : super({});

  int get total => state.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);

  void add(Product product) {
    var newState = state;
    if (state.containsKey(product)) {
      newState[product] = newState[product]! + 1;
    } else {
      newState[product] = 1;
    }
    state = {...newState};
  }

  void remove(Product product) {
    var newState = state;
    if (state.containsKey(product) && state[product] == 1) {
      newState.removeWhere((key, value) => key == product);
    } else {
      newState[product] = state[product]! - 1;
    }
    state = {...newState};
  }
}
