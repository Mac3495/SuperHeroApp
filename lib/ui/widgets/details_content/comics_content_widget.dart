import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/comic_model.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/ui/widgets/build_error_widget.dart';
import 'package:super_hero_app/ui/widgets/list/comics_list_widget.dart';
import 'package:super_hero_app/ui/widgets/no_data_widget.dart';
import 'package:super_hero_app/view_models/comic_view_model.dart';

class ComicsContentWidget extends ConsumerWidget {
  final HeroModel hero;
  const ComicsContentWidget({super.key, required this.hero});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(comicViewModel(hero.id));
    return SafeArea(
        child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              model.when(
                data: (data) {
                  final comicsList = data as List<ComicModel>;
                  if (comicsList.isEmpty) {
                    return  const NoDataWidget(
                      description: 'There are no comics yet',
                      lottieAsset: 'assets/lottie/superman.json',
                    );
                  }
                  return Column(
                    children: [
                      const SizedBox(height: 12,),
                      ComicsList(comicsList: comicsList)
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