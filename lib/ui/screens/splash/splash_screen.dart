import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:super_hero_app/core/utils/app_colors.dart';
import 'package:super_hero_app/ui/screens/home/home_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const String route = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(92),
        child: Center(
          child: Lottie.asset(
            'assets/lottie/superman.json',
            width: 200
          ),
        ),
      ),
    );
  }
}