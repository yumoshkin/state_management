import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';

class ItemChanger extends StatelessWidget {
  const ItemChanger({Key? key, required this.product}) : super(key: key);
  final Product product;

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
          onPressed: () {
            context.read<CartState>().remove(product);
          },
        ),
        Consumer<CartState>(
          builder: (context, state, child) {
            return Container(
              constraints: BoxConstraints(minWidth: 30),
              alignment: Alignment.center,
              child: Text(
                '${state.products[product]}',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
        IconButton(
          padding: EdgeInsets.all(4),
          constraints: BoxConstraints(),
          icon: Icon(
            Icons.add_circle,
            color: Colors.green[400],
          ),
          onPressed: () {
            context.read<CartState>().add(product);
          },
        ),
      ],
    );
  }
}
