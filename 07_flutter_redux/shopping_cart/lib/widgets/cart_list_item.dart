import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/item_image_name.dart';
import 'package:shopping_cart/widgets/item_price.dart';
import 'package:shopping_cart/widgets/item_changer_connector.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    Key? key,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  final Product product;
  final int quantity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemImageName(product: product, size: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemPrice(price: product.price),
                SizedBox(width: 20),
                ItemChangerConnector(product: product),
                ItemPrice(price: product.price * quantity),
                SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
