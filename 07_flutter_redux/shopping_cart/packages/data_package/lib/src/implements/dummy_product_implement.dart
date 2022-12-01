import 'package:injectable/injectable.dart';

import 'package:data_package/src/services/product_service.dart';
import 'package:model_package/model_package.dart';

const List<Product> products = [
  Product(
    id: 1,
    name: 'Яблоко',
    price: 20,
    image: 'assets/images/apple.jpg',
  ),
  Product(
    id: 2,
    name: 'Апельсин',
    price: 30,
    image: 'assets/images/orange.jpg',
  ),
  Product(
    id: 1,
    name: 'Груша',
    price: 25,
    image: 'assets/images/pear.jpg',
  ),
];

@LazySingleton(as: ProductService)
class DummyProductImplement implements ProductService {
  @override
  Future<List<Product>>? getAll() async {
    await Future<dynamic>.delayed(Duration(seconds: 1));

    return products;
  }

  @override
  Future<Product>? getById(int id) async {
    await Future<dynamic>.delayed(Duration(seconds: 1));

    return products[id];
  }
}
