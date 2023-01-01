import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/main.dart';
import 'package:widget/view/auth/singin.dart';

import '../../../shared/isBlack.dart';

class ProfilController extends GetxController {
  late bool sWitch = false;

  onchangeSwitch(bool f) {
    if (f == true) {
      Get.changeTheme(Themes.themdark);
      shardp!.setString("themeColor", "ThemeData#7e127");
    } else {
      Get.changeTheme(Themes.themlight);
      shardp!.setString("themeColor", "ThemeData#32eff");
    }

    sWitch = f;

    update();
  }

  logout() {
    Get.defaultDialog(
      title: "checkout process",
      titleStyle: const TextStyle(
          color: Color.fromARGB(255, 255, 120, 120), fontFamily: "cairo"),
      middleText: "Are you sure about the exit process?",
      middleTextStyle: const TextStyle(fontFamily: "cairo"),
      confirm: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: MaterialButton(
            minWidth: 30,
            height: 47,
            color: colorbutton,
            textColor: const Color.fromARGB(255, 235, 235, 235),
            onPressed: () {
              shardp!.remove("emailKey");
              Get.to(() => const Singin());
            },
            child: const Text(
              "  Confirme  ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: "cairo"),
            ),
          ),
        ),
      ),
      cancel: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: MaterialButton(
            minWidth: 40,
            height: 47,
            color:
                isblack(Colors.black, const Color.fromARGB(255, 105, 105, 105)),
            textColor: Colors.white,
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "     cancel     ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: "cairo"),
            ),
          ),
        ),
      ),
    );
  }
}
