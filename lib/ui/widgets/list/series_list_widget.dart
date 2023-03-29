import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/series_model.dart';
import 'package:super_hero_app/ui/widgets/item_list/series_item_widget.dart';

class SeriesListWidget extends ConsumerWidget {
  final List<SeriesModel> seriesList;
  const SeriesListWidget({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: seriesList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((_, index) {
        final series = seriesList[index];
        return Consumer(builder: (_, ref, __) {
            return SeriesItemWidget(
              series: series,
            );
          }
        );
      }),
    );
  }
}