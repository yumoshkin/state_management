import 'package:flutter/material.dart';

import 'package:business_package/business_package.dart';

class MyInheritedWidget extends InheritedWidget {
  final CartBloc bloc;

  const MyInheritedWidget({Key? key, required Widget child, required this.bloc})
      : super(key: key, child: child);

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget old) {
    return old.bloc != bloc;
  }
}
