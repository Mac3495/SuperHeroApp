import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_hero_app/core/utils/app_colors.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/ui/screens/details/details_screen.dart';

import '../../../core/extensions/string_extensions.dart';

class HeroItemWidget extends ConsumerWidget {
  final HeroModel hero;
  const HeroItemWidget({super.key, required this.hero});

  void goToHeroDetails(BuildContext context){
    final arguments = HeroDetailsArguments(hero: hero);
    Navigator.pushNamed(context, DetailsScreen.route, arguments: arguments);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () => goToHeroDetails(context) ,
        child: Container(
          width: double.infinity,
          height: 245,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: const Offset(1, 2)),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  hero.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                    ),
                    color: AppColors.primary
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hero.name.capitalize(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}