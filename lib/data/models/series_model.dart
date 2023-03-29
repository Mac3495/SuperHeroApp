// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SeriesModel {
  int? id;
  String? title;
  String? description;
  String? image;
  SeriesModel({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  factory SeriesModel.fromMap(Map<String, dynamic> map) {
    return SeriesModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      image: map['thumbnail'] != null ? '${map['thumbnail']['path']}.${map['thumbnail']['extension']}' : null,
    );
  }

  factory SeriesModel.fromJson(String source) => SeriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SeriesModel(id: $id, title: $title, description: $description, image: $image)';
  }
}
