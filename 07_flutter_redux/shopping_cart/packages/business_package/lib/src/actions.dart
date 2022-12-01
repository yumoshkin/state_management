import 'package:model_package/model_package.dart';

class AddCartAction {
  final Product product;
  AddCartAction({required this.product});
}

class RemoveCartAction {
  final Product product;
  RemoveCartAction({required this.product});
}
