import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';

class ItemChanger extends StatelessWidget {
  const ItemChanger({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CartState>(context);

    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.all(4),
          constraints: BoxConstraints(),
          icon: Icon(
            Icons.remove_circle,
            color: Colors.grey[700],
          ),
          onPressed: () => state.remove(product),
        ),
        Observer(
          builder: (context) {
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
          onPressed: () => state.add(product),
        ),
      ],
    );
  }
}
