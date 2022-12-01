import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/cart_empty.dart';
import 'package:shopping_cart/widgets/cart_list.dart';
import 'package:shopping_cart/widgets/cart_total.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

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
      body: BlocBuilder<CartCubit, Map<Product, int>>(
        builder: (context, state) {
          return state.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      CartList(products: state),
                      CartTotal(total: context.read<CartCubit>().total),
                      // CartTotal(total: state.total),
                    ],
                  ),
                )
              : CartEmpty();
        },
      ),
    );
  }
}
