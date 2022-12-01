import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
class CartBloc extends Bloc<CartEvent, Map<Product, int>> {
  CartBloc() : super({}) {
    on<AddCartEvent>((event, emit) => emit(_mapEventToState(event)));
    on<RemoveCartEvent>((event, emit) => emit(_mapEventToState(event)));
  }

  Map<Product, int> _mapEventToState(dynamic event) {
    final newState = {...state};
    final product = event.product;

    if (event is AddCartEvent) {
      if (newState.containsKey(event.product)) {
        newState[product] = newState[product]! + 1;
      } else {
        newState[product] = 1;
      }
    } else if (event is RemoveCartEvent) {
      if (state.containsKey(product) && state[product] == 1) {
        newState.removeWhere((key, value) => key == product);
      } else {
        newState[product] = state[product]! - 1;
      }
    }

    return newState;
  }

  int get total => state.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);
}
