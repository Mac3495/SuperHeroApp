// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventModel {
  int? id;
  String? title;
  String? description;
  String? image;
  EventModel({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      image: map['thumbnail'] != null ? '${map['thumbnail']['path']}.${map['thumbnail']['extension']}' : null,
    );
  }

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(id: $id, title: $title, description: $description, image: $image)';
  }
}
