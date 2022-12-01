// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:business_package/src/app_state.dart' as _i3;
import 'package:business_package/src/product_data.dart' as _i5;
import 'package:data_package/data_package.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:model_package/model_package.dart' as _i4;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AppState>(
        () => _i3.AppState(products: gh<Map<_i4.Product, int>>()));
    gh.factory<_i5.ProductData>(
        () => _i5.ProductData(productService: gh<_i6.ProductService>()));
    return this;
  }
}
