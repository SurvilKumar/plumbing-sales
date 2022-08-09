import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

class TabCardView extends StatelessWidget {
  const TabCardView({
    Key? key,
    required this.size,
    required this.lable,
    required this.iconData,
    required this.onPressed,
    required this.svgicon,
  }) : super(key: key);

  final Size size;
  final String svgicon;
  final String lable;
  final IconData iconData;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ConstantsData.blackcommancolor,
      ),
      width: size.width * 0.4,
      height: size.width * 0.4,
      child: IconButton(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(svgicon),
            Text(lable,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: ConstantsData.whitecolor,
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w700)))
          ],
        ),
        onPressed: onPressed,
        iconSize: 80,
        color: ConstantsData.whitecolor,
      ),
    );
  }
}
