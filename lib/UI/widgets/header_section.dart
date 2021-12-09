import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milky_way/controllers/home_controller.dart';
import 'package:milky_way/utils/utils.dart';

import '../homepage.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection({
    Key? key,
    required this.controller,
    required this.isPortrait,
  }) : super(key: key);

  final HomePageController controller;
  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return GetX<HomePageController>(builder: (controller) {
      log(controller.themeMode.value.toString());
      return Expanded(
          flex: isPortrait ? 1 : 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: isPortrait ? 20 : 8, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isPortrait) ThemeSwitcherWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          !isPortrait
                              ? ThemeSwitcherWidget()
                              : const SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (controller.errorText.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: isPortrait ? 8 : 3),
                                  child: Text(
                                    controller.errorText.value,
                                    style: Get.textTheme.bodyText1!
                                        .copyWith(color: Colors.red),
                                  ),
                                ),
                              Text(
                                controller.userExp.value,
                                style: Get.textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 22),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: isPortrait ? 20 : 10,
                    ),
                    Obx(
                      () => Text(
                        controller.answer.value,
                        style: Get.textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isPortrait ? 54 : 40),
                      ),
                    )
                  ],
                )
              ],
            ),
          ));
    });
  }
}

class ThemeSwitcherWidget extends StatelessWidget {
  ThemeSwitcherWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Get.theme.bottomAppBarColor,
          borderRadius: BorderRadius.circular(16)),
      child: Wrap(
        children: [
          GestureDetector(
            onTap: () {
              log(HomePageController.instance.themeMode.toString());
              HomePageController.instance.changeThemeMode(false, context);
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                height: 42,
                width: 42,
                child: Icon(Icons.light_mode_outlined,
                    size: 20,
                    color: HomePageController.instance.themeMode.value ==
                            ThemeMode.light
                        ? Colors.grey
                        : AppTheme.lightDark)),
          ),
          GestureDetector(
            onTap: () {
              HomePageController.instance.changeThemeMode(true, context);
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                height: 42,
                width: 42,
                child: Icon(
                  Icons.mode_night_outlined,
                  size: 20,
                  color: HomePageController.instance.themeMode.value ==
                          ThemeMode.dark
                      ? Colors.white
                      : AppTheme.btnDis,
                )),
          ),
        ],
      ),
    );
  }
}
