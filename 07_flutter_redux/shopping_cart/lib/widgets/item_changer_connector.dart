import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/item_changer.dart';

class ItemChangerConnector extends StatelessWidget {
  const ItemChangerConnector({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return ItemChanger(
          product: product,
          products: vm.products,
          add: vm.onAdd,
          remove: vm.onRemove,
        );
      },
    );
  }
}

class _ViewModel {
  final Map<Product, int> products;
  final void Function(Product) onAdd;
  final void Function(Product) onRemove;

  _ViewModel({
    required this.products,
    required this.onAdd,
    required this.onRemove,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        products: store.state.products,
        onAdd: (product) => store.dispatch(AddCartAction(product: product)),
        onRemove: (product) =>
            store.dispatch(RemoveCartAction(product: product)),
      );
}
