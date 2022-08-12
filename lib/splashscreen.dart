import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sales/presentation/page/home_page.dart';
import 'package:sales/presentation/wigets/animated_text_splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
        splashTransition: SplashTransition.slideTransition,
        animationDuration: const Duration(milliseconds: 200),
        splashIconSize: double.maxFinite,
        centered: true,
        duration: 8500,
        splash: const AnimatedTextSplash(),
        nextScreen: const HomePage());
  }
}
