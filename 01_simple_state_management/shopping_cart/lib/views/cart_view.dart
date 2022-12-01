import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:business_package/business_package.dart';
import 'package:shopping_cart/widgets/cart_empty.dart';
import 'package:shopping_cart/widgets/cart_list.dart';
import 'package:shopping_cart/widgets/cart_total.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: Consumer<CartState>(
        builder: (context, state, child) {
          return state.products.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      CartList(products: state.products),
                      CartTotal(total: state.total),
                    ],
                  ),
                )
              : CartEmpty();
        },
      ),
    );
  }
}
