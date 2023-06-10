// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:test_task/features/home_page/data/models/categories_response.dart';

import '../../../../core/api/main_api.dart';
import 'home_page_datasource.dart';

@LazySingleton(as: DataSource)
class DataSourceImpl implements DataSource {
  final MainApi mainApi;
  DataSourceImpl({required this.mainApi});
  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await mainApi.client().getCategories();

      return response;
    } catch (e) {
      throw Exception();
    }
  }
}
