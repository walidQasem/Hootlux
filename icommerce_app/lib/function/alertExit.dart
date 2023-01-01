import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool>alertExit() {
  Get.defaultDialog(
      title: "Attention",
      middleText: "Do you want to exit the application?",
      actions: [
        ElevatedButton(

            onPressed: () {
              exit(0);
            },
            child: Text("Exit")),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("cancel"))
      ]);
  return Future.value(true);
}
