import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/core/states/charging_state.dart';
import 'package:super_hero_app/core/utils/app_providers.dart';
import 'package:super_hero_app/data/repositories/hero_repository/ihero_repository.dart';

final seriesViewModel = StateNotifierProvider.family<SeriesViewModel, ChargingState, int>((ref, heroId) {
  final heroRepository = ref.watch(heroRepositoryProvider);
  return SeriesViewModel(heroRepository: heroRepository, heroId: heroId);
});

class SeriesViewModel extends StateNotifier<ChargingState>{
  
  final IHeroRepository heroRepository;
  final int heroId;

  SeriesViewModel({ required this.heroRepository, required this.heroId }) : super(const ChargingState.loading()){
    loadHeroSeries(heroId);
  }

  Future<void> loadHeroSeries(int heroId) async {
    try {
      final response = await heroRepository.getHeroSeries('$heroId');
      state = ChargingState.data(response);
    } catch (e) {
      print(e);
      state = const ChargingState.error('Whoops, an unexpected error occurred, please try again');
    }
  }
}