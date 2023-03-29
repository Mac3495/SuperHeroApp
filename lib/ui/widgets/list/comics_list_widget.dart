import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/comic_model.dart';
import 'package:super_hero_app/ui/widgets/item_list/comic_item_widget.dart';

class ComicsList extends ConsumerWidget {
  final List<ComicModel> comicsList;
  const ComicsList({super.key, required this.comicsList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: comicsList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((_, index) {
        final comic = comicsList[index];
        return Consumer(builder: (_, ref, __) {
            return ComicItemWidget(
              comic: comic,
            );
          }
        );
      }),
    );
  }
}