import 'package:model_package/model_package.dart';

abstract class ProductService {
  Future<List<Product>>? getAll();
  Future<Product>? getById(int id);
}
