import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key, required this.products}) : super(key: key);
  final Map<Product, int> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CartListItem(
          product: products.keys.toList()[index],
          quantity: products.values.toList()[index],
          index: index,
        );
      },
    );
  }
}
