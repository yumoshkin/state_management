import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';

class ItemChanger extends ConsumerWidget {
  const ItemChanger({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateProvider);

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
            ref.read(stateProvider.notifier).remove(product);
          },
        ),
        Container(
          constraints: BoxConstraints(minWidth: 30),
          alignment: Alignment.center,
          child: Text(
            '${state[product]}',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          padding: EdgeInsets.all(4),
          constraints: BoxConstraints(),
          icon: Icon(
            Icons.add_circle,
            color: Colors.green[400],
          ),
          onPressed: () {
            ref.read(stateProvider.notifier).add(product);
          },
        ),
      ],
    );
  }
}
