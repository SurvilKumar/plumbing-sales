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

  static animatedtextstyle({Color? color}) {
    return TextStyle(
        color: color ?? ConstantsData.blackcommancolor,
        fontSize: 30,
        fontWeight: FontWeight.w900);
  }
}
