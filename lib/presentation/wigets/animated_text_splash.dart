import 'package:flutter/material.dart';

import 'spashscreenbody.dart';

class AnimatedTextSplash extends StatefulWidget {
  const AnimatedTextSplash({Key? key}) : super(key: key);

  @override
  State<AnimatedTextSplash> createState() => _AnimatedTextSplashState();
}

class _AnimatedTextSplashState extends State<AnimatedTextSplash>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationcontroller;
  bool _finishanimation = false;

  @override
  void initState() {
    super.initState();
    _animationcontroller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    wait(
      _animationcontroller,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) => SplashBody(
          size: size,
          animationcontroller: _animationcontroller,
          finishanimation: _finishanimation,
          constraints: constraints),
    );
  }

  wait(
    AnimationController animationcontroller,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));

    await animationcontroller.forward();
    setState(() {
      _finishanimation = true;
    });
  }
}
