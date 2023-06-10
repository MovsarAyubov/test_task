// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields
import 'package:json_annotation/json_annotation.dart';
import 'package:test_task/features/home_page/domain/entities/category_entity.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends CategoryEntity {
  @override
  @JsonKey(name: "image_url")
  final String imageUrl;
  CategoryModel({
    required int id,
    required String name,
    required this.imageUrl,
  }) : super(id: id, name: name, imageUrl: imageUrl);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
