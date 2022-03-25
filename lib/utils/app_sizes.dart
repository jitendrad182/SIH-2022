import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSizes {
  static late double height10, width10;

  static mediaQueryHeightWidth() {
    height10 = Get.mediaQuery.size.height * 0.0118;
    width10 = Get.mediaQuery.size.width * 0.0118 * 2.1;
  }

  static EdgeInsets horizontalPadding20 =
      EdgeInsets.symmetric(horizontal: height10 * 2);

  static EdgeInsets verticalPadding10 =
      EdgeInsets.symmetric(vertical: height10);
}
