import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/ui/widgets/item_list/hero_item_widget.dart';

class HeroListWidget extends ConsumerWidget {
  final List<HeroModel> heroList;
  const HeroListWidget({super.key, required this.heroList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: heroList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((_, index) {
        final hero = heroList[index];
        return Consumer(builder: (_, ref, __) {
            return HeroItemWidget(
              hero: hero,
            );
          }
        );
      }),
    );
  }
}