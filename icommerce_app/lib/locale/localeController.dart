import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/main.dart';

class MylocalController extends GetxController {
 int indexPageView=1;
  changeLangue(String codelangue) {
    Locale locale = Locale(codelangue);
    shardp!.setString("LocalS", codelangue);
    Get.updateLocale(locale);
  }

  Locale inialLocal =
      shardp!.getString('LocalS') == "ar" ? Locale("ar") : Locale("en");

  chnageIndexpageview(int index) {
    indexPageView = index;
    update();
  }
}
