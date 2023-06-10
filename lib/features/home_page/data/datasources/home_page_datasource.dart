// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../models/categories_response.dart';

abstract class DataSource {
  Future<CategoriesResponse> getCategories();
}
