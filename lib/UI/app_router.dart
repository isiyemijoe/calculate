import 'package:get/route_manager.dart';
import 'package:milky_way/UI/details_page.dart';
import 'homepage.dart';
import 'splash_screen.dart';

class AppRouter {
  static String initialRoute = SplashScreen.routeName;
  static List<GetPage> routes = [
    GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    GetPage(name: HomePage.routeName, page: () => HomePage()),
    GetPage(name: DetailsPage.routeName, page: () => DetailsPage())

  ];
}
