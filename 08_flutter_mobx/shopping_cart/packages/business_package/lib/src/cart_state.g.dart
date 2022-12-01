// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartState on _CartState, Store {
  late final _$productsAtom =
      Atom(name: '_CartState.products', context: context);

  @override
  Map<Product, int> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(Map<Product, int> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$_CartStateActionController =
      ActionController(name: '_CartState', context: context);

  @override
  void add(Product product) {
    final _$actionInfo =
        _$_CartStateActionController.startAction(name: '_CartState.add');
    try {
      return super.add(product);
    } finally {
      _$_CartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Product product) {
    final _$actionInfo =
        _$_CartStateActionController.startAction(name: '_CartState.remove');
    try {
      return super.remove(product);
    } finally {
      _$_CartStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
