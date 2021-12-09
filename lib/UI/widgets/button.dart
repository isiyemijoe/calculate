import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:milky_way/animations/fade_in_animation.dart';
import 'package:milky_way/controllers/home_controller.dart';
import 'package:milky_way/data/models/button_item.dart';
import 'package:milky_way/data/models/enums.dart';
import 'package:milky_way/utils/utils.dart';

class Button extends StatelessWidget {
  final ButtonItem button;

  const Button({Key? key, required this.button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInAnimations(
      delay: 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            decoration: BoxDecoration(
              color: Get.theme.buttonColor,
            ),
            child: MaterialButton(
              splashColor: button.defaultColor == null
                  ? Get.textTheme.bodyText1!.color
                  : button.defaultColor == 2
                      ? AppTheme.btnGreen
                      : button.defaultColor == 3
                          ? AppTheme.btnRed
                          : Colors.black,
              onPressed: () {
                HomePageController.instance.onBtnPressed(button);
              },
              child: Center(
                child: button.type == ButtonType.SVG
                    ? SvgPicture.asset(
                        button.content,
                        color: button.defaultColor == null
                            ? Get.textTheme.bodyText1!.color
                            : button.defaultColor == 2
                                ? AppTheme.btnGreen
                                : button.defaultColor == 3
                                    ? AppTheme.btnRed
                                    : Colors.black,
                      )
                    : Text(
                        button.value,
                        maxLines: 1,
                        style: Get.textTheme.bodyText1!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: button.defaultColor == null
                              ? Get.textTheme.bodyText1!.color
                              : button.defaultColor == 2
                                  ? AppTheme.btnGreen
                                  : button.defaultColor == 3
                                      ? AppTheme.btnRed
                                      : Colors.black,
                        ),
                      ),
              ),
            )),
      ),
    );
  }
}
