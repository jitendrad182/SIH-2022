import 'package:async/async.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_college/const/string_const.dart';
import 'package:my_college/main.dart';
import 'package:my_college/services/db/db_1.dart';
import 'package:my_college/services/db/db_2.dart';
import 'package:my_college/views/dialogs/dialogs.dart';
import 'package:my_college/views/pages/home/home.dart';
import 'package:my_college/views/pages/onboarding/onboarding_page_1.dart';
import 'package:my_college/views/pages/onboarding/onboarding_page_2.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AsyncMemoizer _asyncMemoizer = AsyncMemoizer();

  bool isSignedIn = false;
  String userId = 'userId';
  int userInfo = 0;

  doThis() async {
    isSignedIn = true;
    userId = _auth.currentUser!.uid;
  }

  currentUser() async {
    return _asyncMemoizer.runOnce(() async {
      if (_auth.currentUser?.uid == null) {
        isSignedIn = false;
      } else {
        await doThis();
        await getUserInfo();
      }
      return _auth.currentUser;
    });
  }

  //TODO:
  getUserInfo() async {
    final dbController2 = Get.put(DbController2(), permanent: true);
    await dbController2.getMyInfo();
    userInfo = dbController2.length();
    await getCollegesInfo();
  }

  getCollegesInfo() async {}
  //TODO:

  signOut() async {
    await _auth.signOut();
    isSignedIn = false;
    userId = 'userId';
    userInfo = 0;
    Get.offAll(() => const OnboardingPage1());
  }

  // TODO:
  forgotPassword(String email, BuildContext context) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      await _auth.sendPasswordResetEmail(email: email).then(
        (value) {
          navigatorKey.currentState!.pop();
          Dialogs.defaultDialog2(
              StringConst.resetPassword, StringConst.passwordResetEmail);
        },
      ).catchError(
        (e) {
          navigatorKey.currentState!.pop();
          Dialogs.defaultDialog1(e.message.toString());
        },
      );
    } catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultDialog1(StringConst.anUnexpectedError);
    }
  }

  createUser(
      {String? email, String? password, required BuildContext context}) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
      User? user = userCredential.user;
      if (user != null) {
        await doThis();
        await DbController1().saveUserInfo().then((value) async {
          final dbController2 = Get.put(DbController2(), permanent: true);
          await dbController2.getMyInfo();
          userInfo = dbController2.length();
          Get.offAll(() => HomePage());
        });
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultDialog1(e.message.toString());
    } catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultDialog1(StringConst.anUnexpectedError);
    }
  }

  signInWithEmail(
      {String? email, String? password, required BuildContext context}) async {
    Dialogs.circularProgressIndicatorDialog(context);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      User? user = userCredential.user;
      if (user != null) {
        await doThis();
        await getUserInfo();
        if (userInfo < 1) {
          Get.to(() => OnboardingPage2());
        } else {
          Get.offAll(() => HomePage());
        }
      }
    } on FirebaseAuthException catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultDialog1(e.message.toString());
    } catch (e) {
      navigatorKey.currentState!.pop();
      Dialogs.defaultDialog1(StringConst.anUnexpectedError);
    }
  }
// TODO:
}
