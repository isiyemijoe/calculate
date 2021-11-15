import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milky_way/data/models/media_model.dart';
import 'package:milky_way/utils/utils.dart';

class DetailsPage extends StatefulWidget {
  static String routeName = "/details_page.dart";

  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late MediaModel _mediaModel;

  @override
  void initState() {
    _mediaModel = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        // Add the app bar to the CustomScrollView.
        SliverAppBar(
          floating: false,
          stretch: true,
          pinned: true,
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Get.back();
            },
            child: SizedBox(
              height: 35,
              width: 35,
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Display a placeholder widget to visualize the shrinking size.
          flexibleSpace: Hero(
            tag: _mediaModel.data[0].nasaId!,
            child: Container(
              color: Colors.red,
              width: double.infinity,
              height: Get.height * 0.35,
              child: CachedNetworkImage(
                imageUrl: _mediaModel.links[0].href,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Make the initial height of the SliverAppBar larger than normal.
          expandedHeight: Get.height * 0.3,
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_mediaModel.data[0].title ?? "",
                      style: Get.textTheme.bodyText1!.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      )),
                  UIHelper.mediumSpace(),
                  RichText(
                      text: TextSpan(
                          text: "Center: ",
                          style: Get.textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                        TextSpan(
                            text: _mediaModel.data[0].center ?? "",
                            style: Get.textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ))
                      ])),
                  UIHelper.miniSpace(),
                  RichText(
                      text: TextSpan(
                          text: "Date Created: ",
                          style: Get.textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                        TextSpan(
                            text: _mediaModel.data[0].dateCreated == null
                                ? ""
                                : _mediaModel.data[0].dateCreated!
                                    .toFormattedDate(),
                            style: Get.textTheme.bodyText1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ))
                      ])),
                  UIHelper.mediumSpace(),
                  Text(_mediaModel.data[0].description!),
                  UIHelper.largeSpace(),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
