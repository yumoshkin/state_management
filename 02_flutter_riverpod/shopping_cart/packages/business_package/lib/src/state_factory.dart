import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:business_package/src/state_factory.config.dart';
import 'package:data_package/data_package.dart';

@InjectableInit()
void initializeState() {
  initializeServices();
  GetIt.I.init();
}
