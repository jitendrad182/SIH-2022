import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_college/const/color_const.dart';
import 'package:my_college/const/stream_const.dart';
import 'package:my_college/const/string_const.dart';
import 'package:my_college/controllers/create_profile_controller.dart';
import 'package:my_college/services/auth.dart';
import 'package:my_college/services/db/db_1.dart';
import 'package:my_college/utils/app_sizes.dart';
import 'package:my_college/views/dialogs/dialogs.dart';
import 'package:my_college/views/pages/home/home.dart';
import 'package:my_college/views/pages/onboarding/sign_up_page.dart';
import 'package:my_college/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:my_college/views/widgets/custom_card_widgets/custom_card_widget_1.dart';
import 'package:my_college/views/widgets/custom_titles/custom_title_1.dart';

class OnboardingPage3 extends StatelessWidget {
  OnboardingPage3({Key? key}) : super(key: key);

  final CreateProfileController _controller = Get.find();
  final AuthController _authController = Get.find();

  void onTap(int i, BuildContext context) async {
    _controller.updateStream(StreamConst.streamStringConst(i));
    if (_authController.isSignedIn) {
      Dialogs.circularProgressIndicatorDialog(context);
      await DbController1().saveUserInfo().then((value) {
        Get.offAll(() => HomePage());
      });
    } else {
      Get.to(() => SignUpPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: Padding(
          padding: AppSizes.horizontalPadding20,
          child: Column(
            children: [
              SizedBox(height: AppSizes.height10),
              const CustomTitle1(text: StringConst.chooseYourStream),
              SizedBox(height: AppSizes.height10),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: AppSizes.verticalPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream1,
                            image: Image.asset(
                              StreamConst.streamImageConst(1),
                            ),
                            onPressed: () {
                              onTap(1, context);
                            },
                          ),
                          SizedBox(width: AppSizes.width10 * 2),
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream2,
                            image: Image.asset(
                              StreamConst.streamImageConst(2),
                            ),
                            onPressed: () {
                              onTap(2, context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppSizes.verticalPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream3,
                            image: Image.asset(
                              StreamConst.streamImageConst(3),
                              height: AppSizes.height10 * 5,
                            ),
                            onPressed: () {
                              onTap(3, context);
                            },
                          ),
                          SizedBox(width: AppSizes.width10 * 2),
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream4,
                            image: Image.asset(
                              StreamConst.streamImageConst(4),
                              height: AppSizes.height10 * 5.5,
                            ),
                            onPressed: () {
                              onTap(4, context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppSizes.verticalPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream5,
                            image: Image.asset(
                              StreamConst.streamImageConst(5),
                              height: AppSizes.height10 * 5,
                            ),
                            onPressed: () {
                              onTap(5, context);
                            },
                          ),
                          SizedBox(width: AppSizes.width10 * 2),
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream6,
                            image: Image.asset(
                              StreamConst.streamImageConst(6),
                              height: AppSizes.height10 * 5,
                            ),
                            onPressed: () {
                              onTap(6, context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppSizes.verticalPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream7,
                            image: Image.asset(
                              StreamConst.streamImageConst(7),
                              height: AppSizes.height10 * 5,
                            ),
                            onPressed: () {
                              onTap(7, context);
                            },
                          ),
                          SizedBox(width: AppSizes.width10 * 2),
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream8,
                            image: Image.asset(
                              StreamConst.streamImageConst(8),
                              height: AppSizes.height10 * 5,
                            ),
                            onPressed: () {
                              onTap(8, context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: AppSizes.verticalPadding10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream9,
                            image: Image.asset(
                              StreamConst.streamImageConst(9),
                              height: AppSizes.height10 * 4,
                            ),
                            onPressed: () {
                              onTap(9, context);
                            },
                          ),
                          SizedBox(width: AppSizes.width10 * 2),
                          CustomCardWidget1(
                            color: ColorConst.stream,
                            text: StreamConst.stream10,
                            image: Image.asset(
                              StreamConst.streamImageConst(10),
                              height: AppSizes.height10 * 4.5,
                            ),
                            onPressed: () {
                              onTap(10, context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
