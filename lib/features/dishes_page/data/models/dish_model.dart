import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/dish_entity.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class DishModel extends DishEntity {
  @override
  @JsonKey(name: "image_url")
  final String imageUrl;
  DishModel({
    required super.id,
    required super.name,
    required super.price,
    required super.weight,
    required super.description,
    required this.imageUrl,
    required super.tegs,
  }) : super(imageUrl: imageUrl);

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}
