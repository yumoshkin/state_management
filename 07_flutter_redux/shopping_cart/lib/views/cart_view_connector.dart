import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';
import 'package:shopping_cart/views/cart_view.dart';

class CartViewConnector extends StatelessWidget {
  CartViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return CartView(products: vm.products);
      },
    );
  }
}

class _ViewModel {
  final Map<Product, int> products;

  _ViewModel({
    required this.products,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        products: store.state.products,
      );
}
