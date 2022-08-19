import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/utility.dart';

class TextSplashAnimated extends StatelessWidget {
  const TextSplashAnimated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: AnimatedTextKit(

          pause: const Duration(milliseconds: 500),
          totalRepeatCount: 1,
          animatedTexts: [
            RotateAnimatedText("Huge Range",
                textStyle: GoogleFonts.poppins(
                    textStyle: Utility.animatedtextstyle())),
            RotateAnimatedText("Low Prices",
                textStyle: GoogleFonts.poppins(
                    textStyle: Utility.animatedtextstyle())),
            RotateAnimatedText("Big Brands",
          
                textStyle:
                    GoogleFonts.poppins(textStyle: Utility.animatedtextstyle()))
          ]),
    );
  }
}
