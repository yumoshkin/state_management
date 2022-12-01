import 'package:flutter/material.dart';

import 'package:shopping_cart/views/cart_view_connector.dart';

class AppBarCartButton extends StatelessWidget {
  const AppBarCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => CartViewConnector(),
            ),
          );
        },
      ),
    );
  }
}
