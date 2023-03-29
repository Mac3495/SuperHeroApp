import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/data/models/story_model.dart';
import 'package:super_hero_app/ui/widgets/build_error_widget.dart';
import 'package:super_hero_app/ui/widgets/list/stories_list_widget.dart';
import 'package:super_hero_app/ui/widgets/no_data_widget.dart';
import 'package:super_hero_app/view_models/story_view_model.dart';

class StoriesContentWidget extends ConsumerWidget {
  final HeroModel hero;
  const StoriesContentWidget({super.key, required this.hero});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(storiesViewModel(hero.id));
    return SafeArea(
        child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              model.when(
                data: (data) {
                  final storiesList = data as List<StoryModel>;
                  if (storiesList.isEmpty) {
                    return  const NoDataWidget(
                      description: 'There are no stories yet',
                      lottieAsset: 'assets/lottie/superman.json',
                    );
                  }
                  return Column(
                    children: [
                      StoriesListWidget(storiesList: storiesList)
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