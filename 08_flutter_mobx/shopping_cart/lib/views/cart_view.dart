import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:business_package/business_package.dart';
import 'package:shopping_cart/utils/functions.dart';
import 'package:shopping_cart/widgets/cart_empty.dart';
import 'package:shopping_cart/widgets/cart_list.dart';
import 'package:shopping_cart/widgets/cart_total.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CartState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return state.products.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      CartList(products: state.products),
                      CartTotal(total: getTotal(state.products)),
                    ],
                  ),
                )
              : CartEmpty();
        },
      ),
    );
  }
}
