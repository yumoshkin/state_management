import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:model_package/model_package.dart';

@injectable
@immutable
class AppState {
  final Map<Product, int> products;

  const AppState({
    this.products = const {},
  });

  factory AppState.initial() => const AppState();

  AppState copyWith({
    Map<Product, int>? products,
  }) {
    return AppState(
      products: products ?? this.products,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          products.toString() == other.products.toString();

  @override
  int get hashCode => products.toString().hashCode;

  @override
  String toString() {
    return 'AppState{products: ${products.toString()}';
  }
}
