import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:milky_way/data/models/button_item.dart';
import 'package:milky_way/utils/app_theme.dart';

class HomePageController extends GetxController {
  RxString userExp = "".obs;
  RxString answer = "0".obs;
  RxString errorText = "".obs;
  late Rx<ThemeMode> themeMode;

  static HomePageController get instance => Get.find();

  @override
  void onInit() {
    setupTheme(false);
    // TODO: implement onInit
    super.onInit();
  }

  setupTheme(bool test) {
    if (!test) {
      themeMode = Get.isDarkMode ? ThemeMode.dark.obs : ThemeMode.light.obs;
    }
  }

  changeThemeMode(bool isDark, BuildContext context) async {
    log(isDark.toString());
    if (isDark) {
      Get.changeTheme(AppTheme.iwriteDark);
      Get.changeThemeMode(ThemeMode.dark);

      await Future.delayed(Duration(milliseconds: 250));
      themeMode.trigger(ThemeMode.dark);
    } else {
      Get.changeTheme(AppTheme.iwriteLight);
      Get.changeThemeMode(ThemeMode.light);

      await Future.delayed(Duration(milliseconds: 250));

      themeMode.trigger(ThemeMode.light);
    }
  }

  onBtnPressed(ButtonItem btn) {
    errorText.value = "";
    if (btn.value == "+/-")
      return;
    else if (btn.value == "=") {
      onEqualPressed();
      return;
    } else if (btn.value == "AC") {
      clear();
      return;
    } else if (btn.value == "R") {
      if (userExp.value.isEmpty) return;

      userExp.value = userExp.substring(0, userExp.value.length - 1);
    } else {
      userExp.value += btn.value;
    }
  }

  clear() {
    userExp.value = "";
    answer.value = "0";
    errorText.value = "";
  }

  void onEqualPressed() {
    try {
      String entry = userExp.value;
      if (entry.contains("(") &&
              !entry.substring(entry.indexOf("(")).contains(")") ||
          entry.contains(")") && !entry.contains("("))
        throw UnimplementedError();
      entry =
          entry.replaceAll('x', '*').replaceAll("(", "*").replaceAll(")", "");

      Parser p = Parser();
      double res = p.parse(entry).evaluate(EvaluationType.REAL, ContextModel());
      answer.value = res.toString();
    } catch (e) {
      log(e.toString());
      errorText.value = "Invalid Operation";
    }
  }
}
