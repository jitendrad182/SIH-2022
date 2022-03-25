import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_college/const/color_const.dart';
import 'package:my_college/const/image_const.dart';
import 'package:my_college/utils/app_sizes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: ColorConst.errorPageStatusBarColor,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ImageConst.brokenLink,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
