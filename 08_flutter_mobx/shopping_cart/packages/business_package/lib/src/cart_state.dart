import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:model_package/model_package.dart';

part 'cart_state.g.dart';

@injectable
class CartState = _CartState with _$CartState;

abstract class _CartState with Store {
  @observable
  Map<Product, int> products = {};

  @action
  void add(Product product) {
    var newProducts = <Product, int>{...products};

    if (newProducts.containsKey(product)) {
      newProducts[product] = newProducts[product]! + 1;
    } else {
      newProducts[product] = 1;
    }

    products = {...newProducts};
  }

  @action
  void remove(Product product) {
    var newProducts = <Product, int>{...products};

    if (newProducts.containsKey(product) && newProducts[product] == 1) {
      newProducts.removeWhere((key, value) => key == product);
    } else {
      newProducts[product] = newProducts[product]! - 1;
    }

    products = {...newProducts};
  }
}
