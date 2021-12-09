import 'dart:ui';

import 'enums.dart';

class ButtonItem {
  ButtonType type;
  String value;
  dynamic content;
  bool isOperator;
  int? defaultColor;

  ButtonItem(
      {required this.type,
      required this.value,
      required this.isOperator,
      this.content,
      this.defaultColor});
}
//1 = black 2 = green 3 = red
