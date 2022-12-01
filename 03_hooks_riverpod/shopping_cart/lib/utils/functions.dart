import 'package:flutter/material.dart';

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
