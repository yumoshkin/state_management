import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:business_package/business_package.dart';
import 'package:shopping_cart/widgets/cart_empty.dart';
import 'package:shopping_cart/widgets/cart_list.dart';
import 'package:shopping_cart/widgets/cart_total.dart';

class CartView extends ConsumerWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: state.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  CartList(products: state),
                  CartTotal(total: ref.watch(stateProvider.notifier).total),
                ],
              ),
            )
          : CartEmpty(),
    );
  }
}
