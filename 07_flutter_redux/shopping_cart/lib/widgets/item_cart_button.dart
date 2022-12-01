import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';
import 'package:shopping_cart/utils/functions.dart';

class ItemCartButton extends StatelessWidget {
  const ItemCartButton({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.amber[900],
          ),
          onPressed: () {
            vm.onAdd(product);
            showSnackBarMessage(
              context: context,
              message: 'Продукт добавлен в корзину',
            );
          },
        );
      },
    );
  }
}

class _ViewModel {
  final void Function(Product) onAdd;

  _ViewModel({
    required this.onAdd,
  });

  static _ViewModel fromStore(Store<AppState> store) => _ViewModel(
        onAdd: (product) => store.dispatch(AddCartAction(product: product)),
      );
}
