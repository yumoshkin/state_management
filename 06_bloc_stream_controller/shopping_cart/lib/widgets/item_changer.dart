import 'package:flutter/material.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/my_inherited_widget.dart';

class ItemChanger extends StatelessWidget {
  const ItemChanger({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final bloc = MyInheritedWidget.of(context).bloc;

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
            bloc.event.add(RemoveCartEvent(product: product));
          },
        ),
        Container(
          constraints: BoxConstraints(minWidth: 30),
          alignment: Alignment.center,
          child: StreamBuilder<Map<Product, int>>(
            stream: bloc.state,
            initialData: bloc.products,
            builder: (_, snapshot) {
              return (snapshot.hasData && snapshot.data!.isNotEmpty)
                  ? Text(
                      '${snapshot.data![product]}',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text('');
            },
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
            bloc.event.add(AddCartEvent(product: product));
          },
        ),
      ],
    );
  }
}
