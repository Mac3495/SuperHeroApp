import 'dart:convert';

class ComicModel {
  int? id;
  String? title;
  String? description;
  String? image;

  ComicModel({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  factory ComicModel.fromMap(Map<String, dynamic> map) {
    return ComicModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      image: map['thumbnail'] != null ? '${map['thumbnail']['path']}.${map['thumbnail']['extension']}' : null,
    );
  }

  factory ComicModel.fromJson(String source) => ComicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ComicModel(id: $id, title: $title, description: $description, image: $image)';
  }
}
