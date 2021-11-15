import 'dart:developer';

import 'package:milky_way/data/models/media_model.dart';
import 'package:milky_way/data/models/request_response.dart';
import 'package:milky_way/utils/api_utils.dart';

class NasaRepository {
  static NasaRepository get instance => NasaRepository();
  ApiClient client = ApiClient();

  getNasaMedia() async {
    try {
      var response = await client.get(
          "https://images-api.nasa.gov/search?q=milky%20way&media_type=image&year_start=2017&year_end=2017");
      List<MediaModel> mediaModels = response["collection"]["items"]
          .map<MediaModel>((e) => MediaModel.fromMap(e))
          .toList();
      return RequestRes(response: mediaModels, error: null);
    } catch (e) {
      return RequestRes(response: null, error: ErrorRes(message: e.toString()));
    }
  }
}
