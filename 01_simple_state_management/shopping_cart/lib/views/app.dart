import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:business_package/business_package.dart';
import 'package:shopping_cart/views/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartState>(
      create: (_) => CartState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomeView(),
      ),
    );
  }
}
