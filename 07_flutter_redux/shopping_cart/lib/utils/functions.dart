import 'package:flutter/material.dart';

import 'package:model_package/model_package.dart';

void showSnackBarMessage({
  required BuildContext context,
  required String message,
  int duration = 1,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(fontSize: 16)),
      duration: Duration(seconds: 1),
    ),
  );
}

int getTotal(Map<Product, int> products) {
  return products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element);
}
