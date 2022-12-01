import 'package:flutter/material.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';
import 'package:shopping_cart/utils/functions.dart';
import 'package:shopping_cart/widgets/my_inherited_widget.dart';

class ItemCartButton extends StatelessWidget {
  const ItemCartButton({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final bloc = MyInheritedWidget.of(context).bloc;

    return IconButton(
      icon: Icon(
        Icons.shopping_cart,
        color: Colors.amber[900],
      ),
      onPressed: () {
        bloc.event.add(AddCartEvent(product: product));
        showSnackBarMessage(
          context: context,
          message: 'Продукт добавлен в корзину',
        );
      },
    );
  }
}
