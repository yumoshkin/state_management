import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';
import 'package:shopping_cart/utils/functions.dart';
import 'package:shopping_cart/widgets/cart_empty.dart';
import 'package:shopping_cart/widgets/cart_list.dart';
import 'package:shopping_cart/widgets/cart_total.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key, required this.products}) : super(key: key);
  final Map<Product, int> products;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: widget.products.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  CartList(products: widget.products),
                  CartTotal(total: getTotal(widget.products)),
                ],
              ),
            )
          : CartEmpty(),
    );
  }
}
