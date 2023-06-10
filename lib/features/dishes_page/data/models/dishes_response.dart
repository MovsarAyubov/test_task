// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:test_task/features/dishes_page/data/models/dish_model.dart';

part 'dishes_response.g.dart';

@JsonSerializable()
class DishesResponse {
  final List<DishModel> dishes;
  DishesResponse({
    this.dishes = const [],
  });

  factory DishesResponse.fromJson(Map<String, dynamic> json) =>
      _$DishesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DishesResponseToJson(this);
}
