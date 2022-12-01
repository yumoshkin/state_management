import 'package:flutter/material.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key, required this.total}) : super(key: key);
  final int total;

  @override
  Widget build(BuildContext context) {
    final _textStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Итого: ', style: _textStyle),
          Container(
            constraints: BoxConstraints(minWidth: 60),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('$total', style: _textStyle),
                Icon(Icons.currency_ruble, size: 17),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
