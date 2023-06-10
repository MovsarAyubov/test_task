// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../features/dishes_page/data/models/dish_model.dart';

class OrderModel extends DishModel {
  final int orderAmount;
  OrderModel(
      {this.orderAmount = 1,
      required super.id,
      required super.name,
      required super.price,
      required super.weight,
      required super.description,
      required super.imageUrl,
      required super.tegs});

  OrderModel copyWith({
    int? orderAmount,
    int? id,
    String? name,
    int? price,
    int? weight,
    String? description,
    String? imageUrl,
    List<String>? tegs,
  }) {
    return OrderModel(
      id: id ?? super.id,
      name: name ?? super.name,
      price: price ?? super.price,
      weight: weight ?? super.weight,
      description: description ?? super.description,
      imageUrl: imageUrl ?? super.imageUrl,
      tegs: tegs ?? super.tegs,
      orderAmount: orderAmount ?? this.orderAmount,
    );
  }
}
