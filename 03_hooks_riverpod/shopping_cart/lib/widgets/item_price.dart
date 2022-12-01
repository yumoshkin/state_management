import 'package:flutter/material.dart';

class ItemPrice extends StatelessWidget {
  const ItemPrice({Key? key, required this.price}) : super(key: key);
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 62),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$price',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Icon(Icons.currency_ruble, size: 16),
        ],
      ),
    );
  }
}
