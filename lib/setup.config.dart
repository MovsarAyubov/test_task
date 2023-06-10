// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/main_api.dart' as _i5;
import 'core/cubits/switch/switch_cubit.dart' as _i6;
import 'features/basket_page/presentation/cubit/basket_cubit.dart' as _i4;
import 'features/dishes_page/data/datasources/dishes_datasource.dart' as _i9;
import 'features/dishes_page/data/datasources/dishes_datasource_impl.dart'
    as _i10;
import 'features/dishes_page/data/repositories/dishes_page_repository_impl.dart'
    as _i12;
import 'features/dishes_page/domain/repositories/dishes_page_repository.dart'
    as _i11;
import 'features/dishes_page/domain/usecases/get_dishes.dart' as _i13;
import 'features/dishes_page/presentation/cubit/dishes_cubit.dart' as _i16;
import 'features/home_page/data/datasources/home_page_datasource.dart' as _i7;
import 'features/home_page/data/datasources/home_page_datasource_impl.dart'
    as _i8;
import 'features/home_page/data/repositories/home_page_repository_impl.dart'
    as _i15;
import 'features/home_page/domain/repositories/home_page_respository.dart'
    as _i14;
import 'features/home_page/domain/usecases/get_categories.dart' as _i17;
import 'features/home_page/presentation/cubit/categories_cubit.dart' as _i18;
import 'router/app_router.dart' as _i3;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.lazySingleton<_i4.BasketCubit>(() => _i4.BasketCubit());
  gh.factory<_i5.MainApi>(() => _i5.MainApi());
  gh.lazySingleton<_i6.SwitchCubit>(() => _i6.SwitchCubit());
  gh.lazySingleton<_i7.DataSource>(
      () => _i8.DataSourceImpl(mainApi: gh<_i5.MainApi>()));
  gh.lazySingleton<_i9.DishesDataSource>(
      () => _i10.DishesDataSourceImpl(mainApi: gh<_i5.MainApi>()));
  gh.lazySingleton<_i11.DishesPageRepository>(
      () => _i12.DishesPageRepositoryImpl(source: gh<_i9.DishesDataSource>()));
  gh.lazySingleton<_i13.GetDishes>(
      () => _i13.GetDishes(repository: gh<_i11.DishesPageRepository>()));
  gh.lazySingleton<_i14.HomePageRepository>(
      () => _i15.HomePageRepositoryImpl(gh<_i7.DataSource>()));
  gh.factory<_i16.DishesCubit>(() => _i16.DishesCubit(gh<_i13.GetDishes>()));
  gh.lazySingleton<_i17.GetCategories>(
      () => _i17.GetCategories(repository: gh<_i14.HomePageRepository>()));
  gh.factory<_i18.HomePageCubit>(
      () => _i18.HomePageCubit(gh<_i17.GetCategories>()));
  return getIt;
}
