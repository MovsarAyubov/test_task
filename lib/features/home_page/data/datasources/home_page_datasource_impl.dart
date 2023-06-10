// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:test_task/features/home_page/data/models/category_model.dart';
import 'package:test_task/features/home_page/domain/entities/category_entity.dart';

import '../../../../core/api/main_api.dart';
import '../../../../core/api/urls.dart';
import 'home_page_datasource.dart';

@LazySingleton(as: DataSource)
class DataSourceImpl implements DataSource {
  final MainApi mainApi;
  DataSourceImpl({required this.mainApi});
  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final response = await mainApi.client.get(Uri.parse(Urls.categories));
      final decodedData = jsonDecode(response.body);
      var value = (decodedData['сategories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      return value;
    } catch (e) {
      throw Exception();
    }
  }
}
