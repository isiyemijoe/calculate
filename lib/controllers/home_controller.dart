import 'dart:developer';

import 'package:get/get.dart';
import 'package:milky_way/data/models/media_model.dart';
import 'package:milky_way/data/models/request_response.dart';
import 'package:milky_way/data/repositories/nasa_repository.dart';

class HomePageController extends GetxController {
  RxBool _loading = true.obs;
  RxList<MediaModel> mediaData = <MediaModel>[].obs;
  Rx<ErrorRes?>? error;

  bool get loading => _loading.value;

  @override
  void onInit() {
    // TODO: implement onInit
    getMediaList();
    super.onInit();
  }

  set loading(bool state) => _loading.value = state;

  getMediaList() async {
    RequestRes response = await NasaRepository.instance.getNasaMedia();
    loading = false;
    if (response.error == null) {
      mediaData.assignAll(response.response as List<MediaModel>);
      error = null;
    } else {
      error = response.error.obs;
    }
  }
}
