import 'package:redux/redux.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';

final cartReducer = combineReducers<Map<Product, int>>({
  TypedReducer<Map<Product, int>, AddCartAction>(_add),
  TypedReducer<Map<Product, int>, RemoveCartAction>(_remove),
});

Map<Product, int> _add(Map<Product, int> products, AddCartAction action) {
  var newProducts = <Product, int>{...products};
  var product = action.product;

  if (newProducts.containsKey(product)) {
    newProducts[product] = newProducts[product]! + 1;
  } else {
    newProducts[product] = 1;
  }

  return newProducts;
}

Map<Product, int> _remove(Map<Product, int> products, RemoveCartAction action) {
  var newProducts = <Product, int>{...products};
  var product = action.product;

  if (newProducts.containsKey(product) && newProducts[product] == 1) {
    newProducts.removeWhere((key, value) => key == product);
  } else {
    newProducts[product] = newProducts[product]! - 1;
  }

  return newProducts;
}

AppState appReducer(AppState state, dynamic action) {
  return state.copyWith(
    products: cartReducer(state.products, action),
  );
}
