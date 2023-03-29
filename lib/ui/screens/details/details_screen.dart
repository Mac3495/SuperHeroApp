import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/ui/widgets/details_content/about_content_widget.dart';
import 'package:super_hero_app/ui/widgets/details_content/comics_content_widget.dart';
import 'package:super_hero_app/ui/widgets/details_content/events_content_widget.dart';
import 'package:super_hero_app/ui/widgets/details_content/series_content_widget.dart';
import 'package:super_hero_app/ui/widgets/details_content/stories_content_widget.dart';
import 'package:super_hero_app/ui/widgets/tab_item/tab_item_widget.dart';

class HeroDetailsArguments {
  HeroModel hero;
  HeroDetailsArguments({
    required this.hero,
  });
}

class DetailsScreen extends ConsumerStatefulWidget {
  final HeroDetailsArguments arguments;
  const DetailsScreen({super.key, required this.arguments});

  static const String route = '/Details';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.arguments.hero.name),
          bottom: const TabBar(
            tabs: [
              Tab(child: TabItemWidget(title: 'About')),
              Tab(child: TabItemWidget(title: 'Comics')),
              Tab(child: TabItemWidget(title: 'Events')),
              Tab(child: TabItemWidget(title: 'Series')),
              Tab(child: TabItemWidget(title: 'Stories')),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            AboutContentWidget(hero: widget.arguments.hero),
            ComicsContentWidget(hero: widget.arguments.hero),
            EventsContentWidget(hero: widget.arguments.hero),
            SeriesContentWidget(hero: widget.arguments.hero),
            StoriesContentWidget(hero: widget.arguments.hero)
          ]
        ),
      ),
    );
  }
}