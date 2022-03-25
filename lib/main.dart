import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_college/const/string_const.dart';
import 'package:my_college/services/auth.dart';
import 'package:my_college/views/pages/error_page.dart';
import 'package:my_college/views/pages/home/home.dart';
import 'package:my_college/views/pages/onboarding/introduction_page.dart';
import 'package:my_college/views/pages/onboarding/onboarding_page_2.dart';
import 'package:my_college/views/pages/waiting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConst.appTitle,
      navigatorKey: navigatorKey,
      theme: ThemeData.light(),
      home: FutureBuilder(
        future: _authController.currentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingPage();
          } else if (snapshot.hasError) {
            return const ErrorPage();
          } else if (snapshot.hasData) {
            if (_authController.userInfo >= 1) {
              return HomePage();
            } else {
              return OnboardingPage2();
            }
          } else {
            return const IntroductionPage();
          }
        },
      ),
    );
  }
}
