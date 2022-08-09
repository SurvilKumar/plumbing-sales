import 'package:flutter/cupertino.dart';
import 'package:sales/presentation/utils/constants.dart';

class Utility {
  //customeSizeBox
  static customeSizebox({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  //animated text style

  static animatedtextstylelbl({Color? color}) {
    return TextStyle(
        color: color ?? ConstantsData.blackcommancolor,
        fontSize: 24,
        height: 1.25,
        fontWeight: FontWeight.w700);
  }

  static animatedtextstyle({Color? color}) {
    return TextStyle(
        color: color ?? ConstantsData.blackcommancolor,
        fontSize: 24,
        height: 1.5,
        fontWeight: FontWeight.w700);
  }
}
