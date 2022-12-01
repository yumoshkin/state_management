import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:business_package/business_package.dart';
import 'package:model_package/model_package.dart';
import 'package:shopping_cart/widgets/app_bar_cart_button.dart';
import 'package:shopping_cart/widgets/product_list.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
        centerTitle: true,
        actions: [AppBarCartButton()],
      ),
      body: FutureBuilder<List<Product>>(
        future: GetIt.I.get<ProductData>().productService.getAll(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Контент временно недоступен'));
              }

              if (snapshot.hasData) {
                return ProductList(products: snapshot.data);
              }

              return const Center(
                child: Text('Нет данных'),
              );
            default:
              return const Text('');
          }
        },
      ),
    );
  }
}
