import 'package:super_hero_app/data/models/comic_model.dart';
import 'package:super_hero_app/data/models/event_model.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/data/models/series_model.dart';
import 'package:super_hero_app/data/models/story_model.dart';

abstract class IHeroRepository {
  Future<List<HeroModel>> getHeros();
  Future<List<ComicModel>> getHeroComics(String heroId);
  Future<List<EventModel>> getHeroEvents(String heroId);
  Future<List<SeriesModel>> getHeroSeries(String heroId);
  Future<List<StoryModel>> getHeroStories(String heroId);
}