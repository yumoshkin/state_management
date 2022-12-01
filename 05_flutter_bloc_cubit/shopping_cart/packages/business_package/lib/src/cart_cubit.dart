import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:model_package/model_package.dart';

@injectable
class CartCubit extends Cubit<Map<Product, int>> {
  CartCubit() : super({});

  int get total => state.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);

  void add(Product product) {
    final newState = {...state};

    if (newState.containsKey(product)) {
      newState[product] = newState[product]! + 1;
    } else {
      newState[product] = 1;
    }

    emit(newState);
  }

  void remove(Product product) {
    final newState = {...state};

    if (state.containsKey(product) && state[product] == 1) {
      newState.removeWhere((key, value) => key == product);
    } else {
      newState[product] = state[product]! - 1;
    }

    emit(newState);
  }
}
