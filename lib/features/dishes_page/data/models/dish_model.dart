import '../../domain/entities/dish_entity.dart';

class DishModel extends DishEntity {
  DishModel({
    required super.id,
    required super.name,
    required super.price,
    required super.weight,
    required super.description,
    required super.imageUrl,
    required super.tegs,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      weight: json['weight'],
      description: json['description'],
      imageUrl: json['image_url'],
      tegs:
          (json['tegs'] as List<dynamic>).map((teg) => teg.toString()).toList(),
    );
  }
}
