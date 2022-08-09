import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sales/presentation/utils/constants.dart';
import 'package:sales/presentation/utils/utility.dart';

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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  text: ConstantsData.splashNamep,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: ConstantsData.splashSales,
                    style: TextStyle(color: ConstantsData.blackcommancolor))
              ])),
          Align(
            heightFactor: 0,
            alignment: Alignment.centerRight,
            child: Text(
              ConstantsData.lableEnd,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Utility.customeSizebox(height: size.height * 0.08),
          FadeTransition(
            opacity:
                Tween<double>(begin: 0, end: 1).animate(_animationcontroller),
            child: Column(
              children: [
                Text("Australia’s largest",
                    style: Utility.animatedtextstyle(
                        color: ConstantsData.whitecolor)),
                Text(" online plumbing store",
                    style: Utility.animatedtextstyle(
                        color: ConstantsData.whitecolor))
              ],
            ),
          ),
          Utility.customeSizebox(height: size.height * 0.08),
          SizedBox(
            height: size.height * 0.1,
            child: _finishanimation
                ? AnimatedTextKit(
                    pause: const Duration(milliseconds: 500),
                    totalRepeatCount: 1,
                    animatedTexts: [
                        RotateAnimatedText("Huge Range ",
                            textStyle: Utility.animatedtextstyle()),
                        RotateAnimatedText("Low Price",
                            textStyle: Utility.animatedtextstyle()),
                        RotateAnimatedText("Big Brands ",
                            textStyle: Utility.animatedtextstyle())
                      ])
                : null,
          ),
        ],
      ),
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
