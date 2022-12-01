import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/item_cart_button.dart';
import 'package:shopping_cart/widgets/item_image_name.dart';
import 'package:shopping_cart/widgets/item_price.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemImageName(product: product, size: 120),
            Row(
              children: [
                ItemPrice(price: product.price),
                SizedBox(width: 16),
                ItemCartButton(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
