import 'package:flutter/material.dart';
import 'package:my_college/const/color_const.dart';
import 'package:my_college/const/image_const.dart';
import 'package:my_college/utils/app_sizes.dart';
import 'package:my_college/views/widgets/custom_app_bars/custom_app_bar_1.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      backgroundColor: ColorConst.primaryColor,
      appBar: appBar1,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConst.logo,
              height: AppSizes.height10 * 20,
            ),
            SizedBox(height: AppSizes.height10 * 4),
            const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
