import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/shared/text.dart';

alertD(Function()? confirm, Function()? cancel, String text1, String text2,
    String text3, String? textConfirm, String textCancel) {
  return Get.defaultDialog(
      confirm: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            onPressed: confirm,
            color: colorbutton,
            child: text(" $textConfirm ", Colors.white, 12, FontWeight.bold),
          ),
        ),
      ),
      cancel: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            onPressed: cancel,
            color: const Color.fromARGB(255, 226, 225, 255),
            child:
                text("     $textCancel    ", colorbutton, 12, FontWeight.bold),
          ),
        ),
      ),
      titleStyle: const TextStyle(color: Colors.red, fontFamily: "cairo"),
      middleTextStyle: const TextStyle(
          fontSize: 14, fontFamily: "cairo", fontWeight: FontWeight.bold),
      actions: [
        Center(
          child: Text(
            text3,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "cairo", fontSize: 13, color: Colors.grey),
          ),
        )
      ],
      title: text1,
      middleText: text2);
}
