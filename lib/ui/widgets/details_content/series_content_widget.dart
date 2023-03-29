import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/data/models/series_model.dart';
import 'package:super_hero_app/ui/widgets/build_error_widget.dart';
import 'package:super_hero_app/ui/widgets/list/series_list_widget.dart';
import 'package:super_hero_app/ui/widgets/no_data_widget.dart';
import 'package:super_hero_app/view_models/series_view_model.dart';

class SeriesContentWidget extends ConsumerWidget {
  final HeroModel hero;
  const SeriesContentWidget({super.key, required this.hero});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(seriesViewModel(hero.id));
    return SafeArea(
        child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              model.when(
                data: (data) {
                  final seriesList = data as List<SeriesModel>;
                  if (seriesList.isEmpty) {
                    return  const NoDataWidget(
                      description: 'There are no series yet',
                      lottieAsset: 'assets/lottie/superman.json',
                    );
                  }
                  return Column(
                    children: [
                      const SizedBox(height: 12,),
                      SeriesListWidget(seriesList: seriesList)
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
    );
  }
}