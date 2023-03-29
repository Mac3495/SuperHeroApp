import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/ui/widgets/build_error_widget.dart';
import 'package:super_hero_app/ui/widgets/list/hero_list_widget.dart';
import 'package:super_hero_app/ui/widgets/no_data_widget.dart';
import 'package:super_hero_app/view_models/hero_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const String route = '/Home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(heroViewModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Super Heros'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                model.when(
                  data: (data) {
                    final heroList = data as List<HeroModel>;
                    if (heroList.isEmpty) {
                      return  const NoDataWidget(
                        description: 'There are no heroes yet',
                        lottieAsset: 'assets/lottie/superman.json',
                      );
                    }
                    return Column(
                      children: [
                        const SizedBox(height: 12,),
                        HeroListWidget(heroList: heroList)
                      ],
                    );
                  },
                  error: (error) {
                  return BuildErrorWidget(errorMessage: error,);
                  },
                  loading: () => const Center(
                      child: CircularProgressIndicator(),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
