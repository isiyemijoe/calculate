import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milky_way/controllers/home_controller.dart';
import 'package:milky_way/data/models/button_item.dart';
import 'package:milky_way/utils/constants.dart';

import '../homepage.dart';
import 'button.dart';

class PotraitKeypad extends StatelessWidget {
  const PotraitKeypad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 2,
        child: Obx(
          () => Container(
            padding: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
            decoration: BoxDecoration(
                color: HomePageController.instance.themeMode.value ==
                        ThemeMode.dark
                    ? Get.theme.bottomAppBarColor
                    : Get.theme.bottomAppBarColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: AppConstants.buttons.length,
                itemBuilder: (context, index) {
                  return Button(button: AppConstants.buttons[index]);
                }),
          ),
        ),
      ),
    );
  }
}

class LandscapeKeypad extends StatelessWidget {
  const LandscapeKeypad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Obx(
        () => Container(
          padding: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              color:
                  HomePageController.instance.themeMode.value == ThemeMode.dark
                      ? Get.theme.bottomAppBarColor
                      : Get.theme.bottomAppBarColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Row(
            children: [
              Expanded(
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1.6,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemCount: AppConstants.landscapeButtons.length,
                    itemBuilder: (context, index) {
                      return Button(
                          button: AppConstants.landscapeButtons[index]);
                    }),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      getCustomButton(AppConstants.buttons[1]),
                      getCustomButton(AppConstants.buttons[2]),
                      getCustomButton(AppConstants.buttons[0]),
                    ],
                  ),
                  Row(
                    children: [
                      getCustomButton(AppConstants.buttons[15],
                          height: Get.height * 0.16 * 2),
                      Column(
                        children: [
                          Row(
                            children: [
                              getCustomButton(AppConstants.buttons[3]),
                              getCustomButton(AppConstants.buttons[7]),
                            ],
                          ),
                          Row(
                            children: [
                              getCustomButton(AppConstants.buttons[11]),
                              getCustomButton(AppConstants.buttons[19]),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getCustomButton(ButtonItem button, {double? height}) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        height: height ?? Get.height * 0.17,
        width: Get.height * 0.17,
        child: Button(button: button));
  }
}
