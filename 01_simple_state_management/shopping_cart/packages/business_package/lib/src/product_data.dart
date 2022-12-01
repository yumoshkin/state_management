import 'package:injectable/injectable.dart';

import 'package:data_package/data_package.dart';

@injectable
class ProductData {
  final ProductService productService;

  ProductData({
    required this.productService,
  });
}