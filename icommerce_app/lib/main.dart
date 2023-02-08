import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widget/routes.dart';
import 'bindings/initalbinding.dart';
import 'locale/translation.dart';
import 'locale/localeController.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

SharedPreferences? shardp;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shardp = await SharedPreferences.getInstance();
  // await Firebase.initiùalizeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    MylocalController controller = Get.put(MylocalController());

    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      // theme: ThemeData(fontFamily: "Cairo"),

      theme: shardp!.getString("themeColor") == "ThemeData#7e127"
          ? Themes.themdark
          : Themes.themlight,

      debugShowCheckedModeBanner: false,
      title: "Hotlux",
      getPages: rootee,
      initialBinding: InitalBiding(),
      locale: controller.inialLocal,
      translations: Mylocal(),
    );
  }
}

class Themes {
  static var themdark = ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 54, 54, 54),
    foregroundColor: Color(0xFFFFFFFF),
  ));
  static var themlight = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Colors.black));
}
