import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_college/const/color_const.dart';

AppBar appBar1 = AppBar(
  toolbarHeight: 0,
  elevation: 0,
  systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
    statusBarColor: ColorConst.primaryColor,
  ),
);
