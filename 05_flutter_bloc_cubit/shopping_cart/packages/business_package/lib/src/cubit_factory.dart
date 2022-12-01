import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:business_package/src/cubit_factory.config.dart';
import 'package:data_package/data_package.dart';

@InjectableInit()
void initializeCubit() {
  initializeServices();
  GetIt.I.init();
}
