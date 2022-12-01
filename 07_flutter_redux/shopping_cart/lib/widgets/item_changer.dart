import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';

class ItemChanger extends StatelessWidget {
  const ItemChanger({
    Key? key,
    required this.product,
    required this.products,
    required this.add,
    required this.remove,
  }) : super(key: key);
  final Product product;
  final Map<Product, int> products;
  final void Function(Product) add;
  final void Function(Product) remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.all(4),
          constraints: BoxConstraints(),
          icon: Icon(
            Icons.remove_circle,
            color: Colors.grey[700],
          ),
          onPressed: () => remove(product),
        ),
        Container(
          constraints: BoxConstraints(minWidth: 30),
          alignment: Alignment.center,
          child: products.isNotEmpty
              ? Text(
                  '${products[product]}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(''),
        ),
        IconButton(
          padding: EdgeInsets.all(4),
          constraints: BoxConstraints(),
          icon: Icon(
            Icons.add_circle,
            color: Colors.green[400],
          ),
          onPressed: () => add(product),
        ),
      ],
    );
  }
}
