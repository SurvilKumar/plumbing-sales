import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales/presentation/wigets/text_splash_animated.dart';

import '../utils/constants.dart';
import '../utils/utility.dart';
import 'center_animated_text.dart';

class SplashBody extends StatelessWidget {
  SplashBody({
    Key? key,
    required this.size,
    required AnimationController animationcontroller,
    required bool finishanimation,
    required this.constraints,
  })  : _animationcontroller = animationcontroller,
        _finishanimation = finishanimation,
        super(key: key);

  final Size size;
  final AnimationController _animationcontroller;
  final bool _finishanimation;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,

      children: [
        SvgPicture.asset("assets/svg/rectangle_orange.svg",
            width: size.width, fit: BoxFit.fill),
        SvgPicture.asset(
          "assets/svg/Vector.svg",
          width: size.width,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.067,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.15,
                ),
                child: Image.asset(
                  "assets/png/ps_logo_new.png",
                  width: constraints.maxWidth > 450
                      ? size.width * 0.7
                      : size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Utility.customeSizebox(height: size.height * 0.05),
              CenterAnimatedText(animationcontroller: _animationcontroller),
              Utility.customeSizebox(height: size.height * 0.05),
              SizedBox(
                height: size.height * 0.1,
                width: size.width,
                child: _finishanimation
                    ? SizedBox(
                        height: size.height * 0.1,
                        child: TextSplashAnimated(),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


