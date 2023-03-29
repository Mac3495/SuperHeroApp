import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/core/states/charging_state.dart';
import 'package:super_hero_app/core/utils/app_providers.dart';
import 'package:super_hero_app/data/repositories/hero_repository/ihero_repository.dart';

final heroViewModel = StateNotifierProvider<HeroViewModel, ChargingState>((ref) {
  final heroRepository = ref.watch(heroRepositoryProvider);
  return HeroViewModel(heroRepository: heroRepository);
});

class HeroViewModel extends StateNotifier<ChargingState>{
  
  final IHeroRepository heroRepository;

  HeroViewModel({ required this.heroRepository }) : super(const ChargingState.loading()){
    loadHeros();
  }

  Future<void> loadHeros() async {
    try {
      final response = await heroRepository.getHeros();
      state = ChargingState.data(response);
    } catch (e) {
      print(e);
      state = const ChargingState.error('Whoops, an unexpected error occurred, please try again');
    }
  }
  
}