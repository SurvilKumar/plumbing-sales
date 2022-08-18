

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sales/presentation/page/home_page.dart';
import 'package:sales/presentation/wigets/animated_text_splash.dart';
import 'package:sales/presentation/wigets/page_transition.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
  // pageTransitionType:PageTransitionType.fade ,
        animationDuration: const Duration(milliseconds: 200),
        splashIconSize: double.maxFinite,
        centered: true,
        duration: 9600,
        splash: const AnimatedTextSplash(),
        nextScreen: HomePage());
  }
}




