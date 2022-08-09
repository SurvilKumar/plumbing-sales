import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import '../utils/utility.dart';

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

    return Stack(
      children: [
        SvgPicture.asset("assets/svg/rectangle_orange.svg",
            width: size.width, fit: BoxFit.fill),
        SvgPicture.asset("assets/svg/Vector.svg",
            width: size.width, fit: BoxFit.fill),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/png/ps_logo_new.png",
                alignment: Alignment.center,
              ),
              Utility.customeSizebox(height: size.height * 0.08),
              FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1)
                    .animate(_animationcontroller),
                child: Column(
                  children: [
                    Text(
                      "Australia’s largest",
                      style: GoogleFonts.poppins(
                          textStyle: Utility.animatedtextstylelbl(
                              color: ConstantsData.whitecolor)),
                    ),
                    Text(" online plumbing store",
                        style: GoogleFonts.poppins(
                            textStyle: Utility.animatedtextstylelbl(
                                color: ConstantsData.whitecolor)))
                  ],
                ),
              ),
              Utility.customeSizebox(height: size.height * 0.08),
              SizedBox(
                height: size.height * 0.1,
                width: size.width,
                child: _finishanimation
                    ? SizedBox(
                        height: size.height * 0.1,
                        child: AnimatedTextKit(
                            pause: const Duration(milliseconds: 500),
                            totalRepeatCount: 1,
                            animatedTexts: [
                              RotateAnimatedText("Huge Range ",
                                  textStyle: GoogleFonts.poppins(
                                      textStyle: Utility.animatedtextstyle())),
                              RotateAnimatedText("Low Price",
                                  textStyle: GoogleFonts.poppins(
                                      textStyle: Utility.animatedtextstyle())),
                              RotateAnimatedText("Big Brands ",
                                  textStyle: GoogleFonts.poppins(
                                      textStyle: Utility.animatedtextstyle()))
                            ]),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  wait(
    AnimationController animationcontroller,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    await animationcontroller.forward();
    setState(() {
      _finishanimation = true;
    });
  }
}
