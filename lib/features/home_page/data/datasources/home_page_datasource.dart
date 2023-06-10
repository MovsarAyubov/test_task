// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_task/features/home_page/domain/entities/category_entity.dart';

abstract class DataSource {
  Future<List<CategoryEntity>> getCategories();
}
