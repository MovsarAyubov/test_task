// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:test_task/features/dishes_page/data/models/dish_model.dart';

import '../../../../core/api/main_api.dart';
import '../../../../core/api/urls.dart';
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
      final response = await mainApi.client.get(Uri.parse(Urls.dishes));
      final decodedData = jsonDecode(response.body);
      final dishes = (decodedData['dishes'] as List<dynamic>)
          .map((dish) => DishModel.fromJson(dish))
          .toList();
      return dishes;
    } catch (e) {
      throw Exception();
    }
  }
}
