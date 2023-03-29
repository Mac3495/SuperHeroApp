import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/repositories/hero_repository/hero_repository.dart';
import 'package:super_hero_app/data/repositories/hero_repository/ihero_repository.dart';

final heroRepositoryProvider = Provider<IHeroRepository>((ref) {
  return HeroRepository();
});
