import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/story_model.dart';
import 'package:super_hero_app/ui/widgets/item_list/story_item_widget.dart';

class StoriesListWidget extends ConsumerWidget {
  final List<StoryModel> storiesList;
  const StoriesListWidget({super.key, required this.storiesList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: storiesList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((_, index) {
        final story = storiesList[index];
        return Consumer(builder: (_, ref, __) {
            return StoryItemWidget(
              story: story,
            );
          }
        );
      }),
    );
  }
}