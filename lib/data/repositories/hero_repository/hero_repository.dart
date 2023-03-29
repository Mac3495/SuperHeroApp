import 'dart:convert';

import 'package:super_hero_app/core/utils/config.dart';
import 'package:super_hero_app/core/utils/hash_generator.dart';
import 'package:super_hero_app/core/utils/network_helper.dart';
import 'package:super_hero_app/data/models/comic_model.dart';
import 'package:super_hero_app/data/models/event_model.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/data/models/series_model.dart';
import 'package:super_hero_app/data/models/story_model.dart';
import 'package:super_hero_app/data/repositories/hero_repository/ihero_repository.dart';

class HeroRepository extends IHeroRepository {

  final networkHelper = NetworkHelper(); 

  @override
  Future<List<HeroModel>> getHeros() async {
    final hash = generateHash();
    final url = '${Config.urlBase}?$hash';
    final response = await networkHelper.get(url);
    final map = json.decode(response.body);
    return (map['data']['results'] as List)
        .map((item) => HeroModel.fromMap(item))
        .toList();
  }
  
  @override
  Future<List<ComicModel>> getHeroComics(String heroId) async {
    final hash = generateHash();
    final url = '${Config.urlBase}/$heroId/comics?$hash';
    final response = await networkHelper.get(url);
    final map = json.decode(response.body);
    return (map['data']['results'] as List)
        .map((item) => ComicModel.fromMap(item))
        .toList();
  }
  
  @override
  Future<List<EventModel>> getHeroEvents(String heroId) async {
    final hash = generateHash();
    final url = '${Config.urlBase}/$heroId/events?$hash';
    final response = await networkHelper.get(url);
    final map = json.decode(response.body);
    return (map['data']['results'] as List)
        .map((item) => EventModel.fromMap(item))
        .toList();
  }
  
  @override
  Future<List<SeriesModel>> getHeroSeries(String heroId) async {
    final hash = generateHash();
    final url = '${Config.urlBase}/$heroId/series?$hash';
    final response = await networkHelper.get(url);
    final map = json.decode(response.body);
    return (map['data']['results'] as List)
        .map((item) => SeriesModel.fromMap(item))
        .toList();
  }
  
  @override
  Future<List<StoryModel>> getHeroStories(String heroId) async {
    final hash = generateHash();
    final url = '${Config.urlBase}/$heroId/stories?$hash';
    final response = await networkHelper.get(url);
    final map = json.decode(response.body);
    return (map['data']['results'] as List)
        .map((item) => StoryModel.fromMap(item))
        .toList();
  }

}