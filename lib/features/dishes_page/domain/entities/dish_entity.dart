// ignore_for_file: public_member_api_docs, sort_constructors_first
class DishEntity {
  final int id;
  final String name;
  final int price;
  final int weight;
  final String description;
  final String imageUrl;
  final List<String> tegs;
  DishEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.description,
    required this.imageUrl,
    required this.tegs,
  });
}
