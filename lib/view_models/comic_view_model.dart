import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/core/states/charging_state.dart';
import 'package:super_hero_app/core/utils/app_providers.dart';
import 'package:super_hero_app/data/repositories/hero_repository/ihero_repository.dart';

final comicViewModel = StateNotifierProvider.family<ComicViewModel, ChargingState, int>((ref, heroId) {
  final heroRepository = ref.watch(heroRepositoryProvider);
  return ComicViewModel(heroRepository: heroRepository, heroId: heroId);
});

class ComicViewModel extends StateNotifier<ChargingState>{
  
  final IHeroRepository heroRepository;
  final int heroId;

  ComicViewModel({ required this.heroRepository, required this.heroId }) : super(const ChargingState.loading()){
    loadHeroComics(heroId);
  }

  Future<void> loadHeroComics(int heroId) async {
    try {
      final response = await heroRepository.getHeroComics('$heroId');
      state = ChargingState.data(response);
    } catch (e) {
      print(e);
      state = const ChargingState.error('Whoops, an unexpected error occurred, please try again');
    }
  }
  
}