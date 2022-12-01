import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/cart_empty.dart';
import 'package:shopping_cart/widgets/cart_list.dart';
import 'package:shopping_cart/widgets/cart_total.dart';
import 'package:shopping_cart/widgets/my_inherited_widget.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final bloc = MyInheritedWidget.of(context).bloc;

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: StreamBuilder<Map<Product, int>>(
        stream: bloc.state,
        initialData: bloc.products,
        builder: (_, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CartList(products: snapshot.data!),
                  CartTotal(total: bloc.total),
                ],
              ),
            );
          } else {
            return CartEmpty();
          }
        },
      ),
    );
  }
}
