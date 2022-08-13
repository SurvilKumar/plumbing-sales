import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import '../utils/utility.dart';

class CenterAnimatedText extends StatelessWidget {
  const CenterAnimatedText({
    Key? key,
    required AnimationController animationcontroller,
  })  : _animationcontroller = animationcontroller,
        super(key: key);

  final AnimationController _animationcontroller;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0, end: 1).animate(_animationcontroller),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Australia’s largest",
            style: GoogleFonts.poppins(
                textStyle: Utility.animatedtextstylelbl(
                    color: ConstantsData.whitecolor)),
          ),
          Text("online plumbing store",
              style: GoogleFonts.poppins(
                  textStyle: Utility.animatedtextstylelbl(
                      color: ConstantsData.whitecolor)))
        ],
      ),
    );
  }
}
