import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/core/states/charging_state.dart';
import 'package:super_hero_app/core/utils/app_providers.dart';
import 'package:super_hero_app/data/repositories/hero_repository/ihero_repository.dart';

final eventViewModel = StateNotifierProvider.family<EventViewModel, ChargingState, int>((ref, heroId) {
  final heroRepository = ref.watch(heroRepositoryProvider);
  return EventViewModel(heroRepository: heroRepository, heroId: heroId);
});

class EventViewModel extends StateNotifier<ChargingState>{
  
  final IHeroRepository heroRepository;
  final int heroId;

  EventViewModel({ required this.heroRepository, required this.heroId }) : super(const ChargingState.loading()){
    loadHeroEvents(heroId);
  }

  Future<void> loadHeroEvents(int heroId) async {
    try {
      final response = await heroRepository.getHeroEvents('$heroId');
      state = ChargingState.data(response);
    } catch (e) {
      print(e);
      state = const ChargingState.error('Whoops, an unexpected error occurred, please try again');
    }
  }
}