import 'package:milky_way/data/models/button_item.dart';
import 'package:milky_way/data/models/enums.dart';

import 'app_theme.dart';

class AppConstants {
  static String SVG_PATH = "assets/svgs/";

  static List<ButtonItem> buttons = <ButtonItem>[
    ButtonItem(
        type: ButtonType.STRING,
        value: "AC",
        isOperator: true,
        defaultColor: 2,
        content: "AC"),
    ButtonItem(
        type: ButtonType.SVG,
        content: "assets/svgs/plus_minus.svg",
        isOperator: true,
        defaultColor: 2,
        value: "+/-"),
    ButtonItem(
        type: ButtonType.SVG,
        content: "assets/svgs/percent.svg",
        isOperator: true,
        defaultColor: 2,
        value: "%"),
    ButtonItem(
        type: ButtonType.SVG,
        content: "assets/svgs/division.svg",
        isOperator: true,
        defaultColor: 2,
        value: "/"),
    ButtonItem(
        type: ButtonType.STRING, content: "7", isOperator: false, value: "7"),
    ButtonItem(
        type: ButtonType.STRING, value: "8", isOperator: false, content: "8"),
    ButtonItem(
        type: ButtonType.STRING, value: "9", isOperator: false, content: "9"),
    ButtonItem(
        type: ButtonType.STRING,
        value: "x",
        isOperator: true,
        content: "x",
        defaultColor: 3),
    ButtonItem(
        type: ButtonType.STRING, value: "6", isOperator: false, content: "6"),
    ButtonItem(
        type: ButtonType.STRING, value: "5", isOperator: false, content: "5"),
    ButtonItem(
        type: ButtonType.STRING, value: "4", isOperator: false, content: "4"),
    ButtonItem(
        type: ButtonType.STRING,
        value: "-",
        isOperator: false,
        content: "-",
        defaultColor: 3),
    ButtonItem(
        type: ButtonType.STRING, value: "1", isOperator: false, content: "1"),
    ButtonItem(
        type: ButtonType.STRING, value: "2", isOperator: false, content: "2"),
    ButtonItem(
        type: ButtonType.STRING, value: "3", isOperator: false, content: "3"),
    ButtonItem(
        type: ButtonType.STRING,
        value: "+",
        isOperator: true,
        content: "+",
        defaultColor: 3),
    ButtonItem(
        type: ButtonType.SVG,
        content: "assets/svgs/referesh_light.svg",
        value: "R",
        isOperator: false),
    ButtonItem(
        type: ButtonType.STRING, value: "0", isOperator: false, content: "0"),
    ButtonItem(
        type: ButtonType.STRING, value: ".", isOperator: true, content: "."),
    ButtonItem(
        type: ButtonType.STRING,
        value: "=",
        isOperator: true,
        defaultColor: 3,
        content: "="),
  ];
  static List<ButtonItem> landscapeButtons = <ButtonItem>[
    ButtonItem(
        type: ButtonType.SVG,
        value: "R",
        isOperator: true,
        content: "assets/svgs/delete.svg"),
    ButtonItem(
        type: ButtonType.STRING, content: "7", isOperator: false, value: "7"),
    ButtonItem(
        type: ButtonType.STRING, value: "8", isOperator: false, content: "8"),
    ButtonItem(
        type: ButtonType.STRING, value: "9", isOperator: false, content: "9"),
    ButtonItem(
        type: ButtonType.STRING, value: "(", isOperator: false, content: "("),
    ButtonItem(
        type: ButtonType.STRING, value: "0", isOperator: false, content: "0"),
    ButtonItem(
        type: ButtonType.STRING, value: "6", isOperator: false, content: "6"),
    ButtonItem(
        type: ButtonType.STRING, value: "5", isOperator: false, content: "5"),
    ButtonItem(
        type: ButtonType.STRING, value: "4", isOperator: false, content: "4"),
    ButtonItem(
        type: ButtonType.STRING, value: ")", isOperator: false, content: ")"),
    ButtonItem(
        type: ButtonType.SVG,
        content: "assets/svgs/referesh_light.svg",
        value: "R",
        isOperator: false),
    ButtonItem(
        type: ButtonType.STRING, value: "1", isOperator: false, content: "1"),
    ButtonItem(
        type: ButtonType.STRING, value: "2", isOperator: false, content: "2"),
    ButtonItem(
        type: ButtonType.STRING, value: "3", isOperator: false, content: "3"),
    ButtonItem(
        type: ButtonType.STRING, value: ".", isOperator: true, content: "."),
  ];
}
