// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_task/features/home_page/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
      );
}
