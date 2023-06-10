// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:injectable/injectable.dart';

import '../../../../core/api/main_api.dart';
import '../models/dishes_response.dart';
import 'dishes_datasource.dart';

@LazySingleton(as: DishesDataSource)
class DishesDataSourceImpl implements DishesDataSource {
  final MainApi mainApi;
  DishesDataSourceImpl({
    required this.mainApi,
  });
  @override
  Future<DishesResponse> getDishes() async {
    try {
      final response = await mainApi.client().getDishes();
      return response;
    } catch (e) {
      throw Exception();
    }
  }
}
