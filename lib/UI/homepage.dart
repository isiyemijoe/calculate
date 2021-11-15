import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milky_way/controllers/home_controller.dart';
import 'package:milky_way/utils/utils.dart';
import 'media_tile.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/homepage";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "The Milky Way",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: GetX<HomePageController>(
            init: HomePageController(),
            builder: (controller) {
              if (controller.loading) {
                return Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ));
              }
              if (controller.error != null) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: Colors.black,
                          size: Get.height * 0.1,
                        ),
                        UIHelper.mediumSpace(),
                        Text(
                          controller.error!.value!.message,
                          textAlign: TextAlign.center,
                        )


                      ],
                    ),
                  ),
                );
              }

              return ListView.builder(
                  itemCount: controller.mediaData.length,
                  itemBuilder: (context, index) {
                    return MediaTile(
                      mediaModel: controller.mediaData[index],
                    );
                  });
            }));
  }
}
