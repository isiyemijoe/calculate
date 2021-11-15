import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:milky_way/animations/bottom_up_animations.dart';
import 'package:milky_way/animations/fade_in_animation.dart';
import 'package:milky_way/data/models/media_model.dart';
import 'package:get/get.dart';
import 'package:milky_way/utils/utils.dart';
import 'details_page.dart';


class MediaTile extends StatelessWidget {
  final MediaModel mediaModel;

  const MediaTile({Key? key, required this.mediaModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Hero(
          tag: mediaModel.data[0].nasaId!,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(DetailsPage.routeName, arguments: mediaModel);
            },
            child: Container(
              height: 250,
              margin: EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    color: Colors.grey.shade400,
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      child: CachedNetworkImage(
                        imageUrl: mediaModel.links[0].href,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.9),
                                Colors.black.withOpacity(.6),
                                Colors.black.withOpacity(.0),
                              ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInAnimations(
                            delay: .5,
                            child: Text(
                              mediaModel.data[0].title ?? "",
                              maxLines: 3 ,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22),
                            ),
                          ),
                          UIHelper.miniSpace(),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                BottomUpAnimaitons(
                                  delay: 0.5,
                                  child: Text(
                                    mediaModel.data[0].center ?? "",
                                    style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                BottomUpAnimaitons(
                                  delay: 0.8,
                                  child: VerticalDivider(
                                    color: Colors.white,
                                    endIndent: 3,
                                    indent: 3,
                                    thickness: 2,
                                  ),
                                ),
                                BottomUpAnimaitons(
                                  delay: 1,
                                  child: Text(
                                    mediaModel.data[0].dateCreated == null
                                        ? ""
                                        : mediaModel.data[0].dateCreated!
                                        .toFormattedDate(),
                                    style: Get.textTheme.bodyText1!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
