import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/product_list_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.products}) : super(key: key);
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) =>
          ProductListItem(product: products[index]),
    );
  }
}
