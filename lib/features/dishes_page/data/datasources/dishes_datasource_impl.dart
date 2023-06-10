// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:injectable/injectable.dart';
import 'package:test_task/features/dishes_page/data/models/dish_model.dart';

import '../../../../core/api/main_api.dart';
import 'dishes_datasource.dart';

@LazySingleton(as: DishesDataSource)
class DishesDataSourceImpl implements DishesDataSource {
  final MainApi mainApi;
  DishesDataSourceImpl({
    required this.mainApi,
  });
  @override
  Future<List<DishModel>> getDishes() async {
    try {
      final response = await mainApi.client().getDishes();
      return response;
    } catch (e) {
      throw Exception();
    }
  }
}
