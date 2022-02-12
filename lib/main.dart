import 'package:feedback/feedback.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/settings_controller.dart';
import 'package:todey/core/sqflite_db.dart';
import 'package:todey/modules/onboard/onboard.dart';
import 'package:todey/services/auth_service.dart';
import 'package:todey/utils/routes.dart';
import 'package:todey/utils/theme.dart';
import 'package:todey/utils/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SQFliteDB().initializeDB();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    Get.put(AuthService());
    Get.put(SettingController());
  });
  runApp(BetterFeedback(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Get.isDarkMode ? Brightness.dark : Brightness.light,
        statusBarBrightness:
            Get.isDarkMode ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            Get.isDarkMode ? Brightness.dark : Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    return Phoenix(
      child: ScreenUtilInit(
        designSize: Size(360, 784),
        builder: () {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: Translation(),
            locale: Locale("en", "US"),
            color: Colors.white,
            fallbackLocale: Locale('en', 'US'),
            theme: CustomTheme.buildLightTheme(),
            darkTheme: CustomTheme.buildDarkTheme(),
            home: Onboard(),
            title: "Todey",
            getPages: routes,
          );
        },
      ),
    );
  }
}
