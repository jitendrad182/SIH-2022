import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:my_college/const/color_const.dart';
import 'package:my_college/const/image_const.dart';
import 'package:my_college/const/string_const.dart';
import 'package:my_college/utils/app_sizes.dart';
import 'package:my_college/views/pages/onboarding/onboarding_page_1.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
          statusBarColor: ColorConst.whiteColor,
        ),
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            decoration: const PageDecoration(imageFlex: 2),
            image: Lottie.asset(ImageConst.studyJson),
            title: StringConst.weWillFindCollege.toUpperCase(),
            body: '',
          ),
          PageViewModel(
            decoration: const PageDecoration(imageFlex: 2),
            image: Image.asset(ImageConst.study),
            title: StringConst.letsFindYourCollege.toUpperCase(),
            body: '',
          ),
        ],
        done: Icon(Icons.arrow_circle_right, size: AppSizes.height10 * 4),
        next: Icon(Icons.arrow_forward, size: AppSizes.height10 * 3.5),
        onDone: () {
          Get.to(() => const OnboardingPage1());
        },
      ),
    );
  }
}
