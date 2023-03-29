import 'package:flutter/material.dart';
import 'package:super_hero_app/core/utils/app_colors.dart';

class TabItemWidget extends StatelessWidget {
  final String title;
  const TabItemWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }
}