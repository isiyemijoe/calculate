import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:milky_way/UI/app_router.dart';
import 'package:milky_way/utils/app_theme.dart';
import 'package:milky_way/utils/uihelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text("Back"),
      ),
      body: Card(
        child: Padding(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: Colors.black,
                  size: Get.width * 0.2,
                ),
                UIHelper.mediumSpace(),
                Text(
                  "Something is not right here...",
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.all(8.0),
        ),
        margin: EdgeInsets.zero,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: (BuildContext context, Widget? widget) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomError(errorDetails: errorDetails);
          };
          return widget!;
        },
        initialRoute: AppRouter.initialRoute,
        darkTheme: AppTheme.iwriteDark,
        theme: AppTheme.iwriteLight,
        getPages: AppRouter.routes,
        themeMode: ThemeMode.system);
  }
}
