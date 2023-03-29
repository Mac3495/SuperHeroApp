import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/core/utils/app_colors.dart';
import 'package:super_hero_app/core/utils/config.dart';
import 'package:super_hero_app/data/models/series_model.dart';

import '../../../core/extensions/string_extensions.dart';

class SeriesItemWidget extends ConsumerWidget {
  final SeriesModel series;
  const SeriesItemWidget({super.key, required this.series});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        height: 425,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(1, 3)
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                series.image ?? Config.defaultImage,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                height: 142,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  color: AppColors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        series.title?.capitalize() ?? 'Comic without title',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        series.description?.capitalize() ?? 'Comic without Description',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}