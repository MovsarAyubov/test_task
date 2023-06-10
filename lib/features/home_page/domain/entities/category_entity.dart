// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryEntity {
  final int id;
  final String name;
  final String imageUrl;
  CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  CategoryEntity copyWith({
    int? id,
    String? name,
    String? imageUrl,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  @override
  String toString() =>
      'CategoryEntity(id: $id, name: $name, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant CategoryEntity other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ imageUrl.hashCode;
}
