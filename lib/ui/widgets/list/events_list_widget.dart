import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/data/models/event_model.dart';
import 'package:super_hero_app/ui/widgets/item_list/event_item_widget.dart';

class EventsListWidget extends ConsumerWidget {
  final List<EventModel> eventsList;
  const EventsListWidget({super.key, required this.eventsList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: eventsList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((_, index) {
        final event = eventsList[index];
        return Consumer(builder: (_, ref, __) {
            return EventItemWidget(
              event: event,
            );
          }
        );
      }),
    );
  }
}