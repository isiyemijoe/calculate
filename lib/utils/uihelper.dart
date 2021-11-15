import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIHelper {
  static miniSpace({bool horizontal = false}) {
    return SizedBox(
      height: horizontal ? 0 : 8,
      width: horizontal ? 8 : 0,
    );
  }

  static smallSpace({bool horizontal = false}) {
    return SizedBox(
      height: horizontal ? 0 : 10,
      width: horizontal ? 10 : 0,
    );
  }

  static mediumSpace({bool horizontal = false}) {
    return SizedBox(
      height: horizontal ? 0 : 20,
      width: horizontal ? 20 : 0,
    );
  }

  static largeSpace({bool horizontal = false}) {
    return SizedBox(
      height: horizontal ? 0 : 40,
      width: horizontal ? 40 : 0,
    );
  }

  static customSpace(double count, {bool horizontal = false}) {
    return SizedBox(
      height: horizontal ? 0 : count,
      width: horizontal ? count : 0,
    );
  }

  static void error(message, {String title = ""}) {
    Get.showSnackbar(GetBar(
      message: message,
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      borderRadius: 10,
      backgroundColor: Colors.red,
    ));
  }

  static void success(
    message, {
    String title = "",
  }) {
    Get.showSnackbar(GetBar(
      message: message,
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      borderRadius: 10,
      backgroundColor: Colors.green,
    ));
  }
}
