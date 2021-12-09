import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:milky_way/controllers/home_controller.dart';
import 'package:milky_way/utils/utils.dart';

void main() {
  var controller = Get.put<HomePageController>(HomePageController());

  group("Test Each key input", () {
    group("Text Each key input", () {
      test("Test out number 7 ", () {
        //testout one numer
        controller.onBtnPressed(AppConstants.buttons[4]);
        expect(controller.userExp.value, "7");
      });

      test("Test out number 721 ", () {
        //Test out multiple number
        //testout one numer
        controller.onBtnPressed(AppConstants.buttons[13]);
        controller.onBtnPressed(AppConstants.buttons[12]);

        expect(controller.userExp.value, "721");
      });
    });

    group("Test Basic Arithmethic", () {
      setUp(() {
        controller.clear();
      });
      test("Test out number 70 + 20 ", () {
        //Test out multiple number
        //testout one numer
        controller.onBtnPressed(AppConstants.buttons[4]); //7
        controller.onBtnPressed(AppConstants.buttons[17]); //0
        controller.onBtnPressed(AppConstants.buttons[15]); //+

        controller.onBtnPressed(AppConstants.buttons[13]); //2
        controller.onBtnPressed(AppConstants.buttons[17]); //0

        expect(controller.userExp.value, "70+20");
      });
      test("Test out equal to =", () {
        controller.onBtnPressed(AppConstants.buttons[4]); //7
        controller.onBtnPressed(AppConstants.buttons[17]); //0
        controller.onBtnPressed(AppConstants.buttons[15]); //+

        controller.onBtnPressed(AppConstants.buttons[13]); //2
        controller.onBtnPressed(AppConstants.buttons[17]); //

        controller.onBtnPressed(AppConstants.buttons[19]); //0

        expect(controller.answer.value, "90.0");
      });
    });
    //   test('Test Group 1', () {});
  });
}
