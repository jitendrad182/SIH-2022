import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_college/const/color_const.dart';
import 'package:my_college/const/image_const.dart';
import 'package:my_college/const/string_const.dart';
import 'package:my_college/utils/app_sizes.dart';
import 'package:my_college/views/pages/onboarding/onboarding_page_2.dart';
import 'package:my_college/views/pages/onboarding/sign_in_page.dart';
import 'package:my_college/views/widgets/custom_app_bars/custom_app_bar_1.dart';
import 'package:my_college/views/widgets/custom_buttons/custom_button_1.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConst.primaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppSizes.height10 * 5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageConst.logo,
                      height: AppSizes.height10 * 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: AppSizes.horizontalPadding20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton1(
                      text: StringConst.getStarted,
                      buttonColor: ColorConst.primaryColor,
                      textColor: ColorConst.whiteColor,
                      onTap: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        Get.to(() => OnboardingPage2());
                      },
                    ),
                    SizedBox(height: AppSizes.height10 * 2.5),
                    CustomButton1(
                      text: StringConst.gotAnAccount,
                      buttonColor: ColorConst.whiteColor,
                      textColor: ColorConst.blackColor,
                      onTap: () {
                        FocusManager.instance.primaryFocus!.unfocus();
                        Get.to(() => SignInPage());
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
