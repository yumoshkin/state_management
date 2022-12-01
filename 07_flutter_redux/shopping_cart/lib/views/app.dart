import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:business_package/business_package.dart';
import 'package:redux/redux.dart';
import 'package:shopping_cart/views/home_view.dart';

class App extends StatelessWidget {
  App({super.key});

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: Builder(
        builder: (BuildContext innerContext) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            home: HomeView(),
          );
        },
      ),
    );
  }
}
