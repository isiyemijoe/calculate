import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:milky_way/UI/widgets/header_section.dart';
import 'package:milky_way/controllers/home_controller.dart';
import 'package:milky_way/data/models/button_item.dart';
import 'package:milky_way/utils/utils.dart';

import 'widgets/keypad.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/homepage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return SafeArea(
            bottom: false,
            left: orientation == Orientation.portrait,
            right: orientation == Orientation.portrait,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              HeaderSection(
                controller: controller,
                isPortrait: orientation == Orientation.portrait,
              ),
              orientation == Orientation.portrait
                  ? PotraitKeypad()
                  : LandscapeKeypad()
            ]));
      }),
    );
  }
}
