// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HeroModel {
  int id;
  String name;
  String description;
  String image;
  HeroModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });


  factory HeroModel.fromMap(Map<String, dynamic> map) {
    return HeroModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: '${map['thumbnail']['path']}.${map['thumbnail']['extension']}',
    );
  }

  factory HeroModel.fromJson(String source) => HeroModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hero(id: $id, name: $name, description: $description, image: $image)';
  }
}
