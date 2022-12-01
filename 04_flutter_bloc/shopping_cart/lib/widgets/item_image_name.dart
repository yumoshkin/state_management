import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';

class ItemImageName extends StatelessWidget {
  const ItemImageName({Key? key, required this.product, required this.size})
      : super(key: key);
  final Product product;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Image.asset(product.image),
        ),
        SizedBox(width: 8),
        Text(
          product.name,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
