import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:milky_way/data/models/media_model.dart';

abstract class Service {
  Map<String, dynamic> get(int i);
}

class Api implements Service {
  @override
  Map<String, dynamic> get(int i) {
    if (i == 0) {
      return {"Api_status": "200"};
    } else if (i == 1) {
      return {"Api_status": "400"};
    } else {
      return {
        "data": [
          {
            "href":
                "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e001362/collection.json",
            "data": [
              {
                "album": ["Test"],
                "center": "GSFC",
                "title": "A monster in the Milky Way",
                "keywords": ["A monster in the Milky Way"],
                "location": "Greenbelt, MD",
                "nasa_id": "GSFC_20171208_Archive_e001362",
                "date_created": "2017-12-08T00:00:00Z",
                "media_type": "image",
                "description":
                    "This image shows the star-studded center of the Milky Way towards the constellation of Sagittarius. The crowded center of our galaxy contains numerous complex and mysterious objects that are usually hidden at optical wavelengths by clouds of dust — but many are visible here in these infrared observations from Hubble.  However, the most famous cosmic object in this image still remains invisible: the monster at our galaxy’s heart called Sagittarius A*. Astronomers have observed stars spinning around this supermassive black hole (located right in the center of the image), and the black hole consuming clouds of dust as it affects its environment with its enormous gravitational pull.  Infrared observations can pierce through thick obscuring material to reveal information that is usually hidden to the optical observer. This is the best infrared image of this region ever taken with Hubble, and uses infrared archive data from Hubble’s Wide Field Camera 3, taken in September 2011.     Credit: NASA, ESA, and G. Brammer <b><a href=\"http://www.nasa.gov/audience/formedia/features/MP_Photo_Guidelines.html\" rel=\"nofollow\">NASA image use policy.</a></b>  <b><a href=\"http://www.nasa.gov/centers/goddard/home/index.html\" rel=\"nofollow\">NASA Goddard Space Flight Center</a></b> enables NASA’s mission through four scientific endeavors: Earth Science, Heliophysics, Solar System Exploration, and Astrophysics. Goddard plays a leading role in NASA’s accomplishments by contributing compelling scientific knowledge to advance the Agency’s mission.  <b>Follow us on <a href=\"http://twitter.com/NASA_GoddardPix\" rel=\"nofollow\">Twitter</a></b>  <b>Like us on <a href=\"http://www.facebook.com/pages/Greenbelt-MD/NASA-Goddard/395013845897?ref=tsd\" rel=\"nofollow\">Facebook</a></b>  <b>Find us on <a href=\"http://instagram.com/nasagoddard?vm=grid\" rel=\"nofollow\">Instagram</a></b>"
              }
            ],
            "links": [
              {
                "href":
                    "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e001362/GSFC_20171208_Archive_e001362~thumb.jpg",
                "rel": "preview",
                "render": "image"
              }
            ]
          },
          {
            "href":
                "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000261/collection.json",
            "data": [
              {
                "album": ["Test"],
                "center": "GSFC",
                "title":
                    "Astronomers Discover Dizzying Spin of the Milky Way Galaxy’s “Halo”",
                "keywords": [
                  "Astronomers Discover Dizzying Spin of the Milky Way Galaxy’s “Halo”",
                  "galactichalo"
                ],
                "location": "Greenbelt, MD",
                "nasa_id": "GSFC_20171208_Archive_e000261",
                "date_created": "2017-12-08T00:00:00Z",
                "media_type": "image",
                "description":
                    "Our Milky Way galaxy and its small companions are surrounded by a giant halo of million-degree gas (seen in blue in this artists' rendition) that is only visible to X-ray telescopes in space. University of Michigan astronomers discovered that this massive hot halo spins in the same direction as the Milky Way disk and at a comparable speed.  Read more: <a href=\"http://go.nasa.gov/29VgLdK\" rel=\"nofollow\">go.nasa.gov/29VgLdK</a>  Credit: NASA/CXC/M.Weiss/Ohio State/A Gupta et al  <b><a href=\"http://www.nasa.gov/audience/formedia/features/MP_Photo_Guidelines.html\" rel=\"nofollow\">NASA image use policy.</a></b>  <b><a href=\"http://www.nasa.gov/centers/goddard/home/index.html\" rel=\"nofollow\">NASA Goddard Space Flight Center</a></b> enables NASA’s mission through four scientific endeavors: Earth Science, Heliophysics, Solar System Exploration, and Astrophysics. Goddard plays a leading role in NASA’s accomplishments by contributing compelling scientific knowledge to advance the Agency’s mission.  <b>Follow us on <a href=\"http://twitter.com/NASAGoddardPix\" rel=\"nofollow\">Twitter</a></b>  <b>Like us on <a href=\"http://www.facebook.com/pages/Greenbelt-MD/NASA-Goddard/395013845897?ref=tsd\" rel=\"nofollow\">Facebook</a></b>  <b>Find us on <a href=\"http://instagrid.me/nasagoddard/?vm=grid\" rel=\"nofollow\">Instagram</a></b>      "
              }
            ],
            "links": [
              {
                "href":
                    "https://images-assets.nasa.gov/image/GSFC_20171208_Archive_e000261/GSFC_20171208_Archive_e000261~thumb.jpg",
                "rel": "preview",
                "render": "image"
              }
            ]
          }
        ]
      };
    }
  }
}

class Controller extends GetxController {
  Map<String, dynamic>? data;

  void getData(int i) {
    data = Get.find<Service>().get(i);
  }
}

void main() {
  Get.put<Service>(Api());
  Get.put<Controller>(Controller());
  test('Test Group 1', () {
    var service = Get.find<Service>();
    expect(service.get(0), {"Api_status": "200"});
    expect(service.get(1), {"Api_status": "400"});

    List<MediaModel> testModels =
        service.get(2)["data"].map<MediaModel>((e) => MediaModel.fromMap(e)).toList();
    expect(testModels.length, 2);
  });
}
