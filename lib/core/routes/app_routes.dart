import 'package:flutter/material.dart';
import 'package:super_hero_app/data/models/hero_model.dart';
import 'package:super_hero_app/ui/screens/details/details_screen.dart';
import 'package:super_hero_app/ui/screens/home/home_screen.dart';
import 'package:super_hero_app/ui/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case DetailsScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => DetailsScreen(
                arguments: settings.arguments as HeroDetailsArguments));
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
    }
  }
}
