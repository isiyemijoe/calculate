import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:milky_way/UI/homepage.dart';
import 'package:milky_way/animations/fade_in_animation.dart';
import 'package:milky_way/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    await Future.delayed(Duration(seconds: 3));
    Get.toNamed(HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: FadeInAnimations(
                delay: 0.8,
                child: SvgPicture.asset("${AppConstants.SVG_PATH}yoyo_logo.svg",
                    width: Get.width * 0.2, fit: BoxFit.fitHeight),
              ),
            ),
          )),
    );
  }
}
