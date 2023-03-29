// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StoryModel {
  int? id;
  String? title;
  StoryModel({
    this.id,
    this.title,
  });

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  factory StoryModel.fromJson(String source) => StoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoryModel(id: $id, title: $title)';
}
