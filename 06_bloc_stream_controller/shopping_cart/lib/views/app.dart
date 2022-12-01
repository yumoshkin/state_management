import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:business_package/business_package.dart';
import 'package:shopping_cart/views/home_view.dart';
import 'package:shopping_cart/widgets/my_inherited_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final CartBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I.get<CartBloc>();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      bloc: bloc,
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
