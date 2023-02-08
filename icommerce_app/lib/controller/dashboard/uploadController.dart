import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  List<Widget> widgetList = [];
  plus() {
    widgetList.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:  const Color.fromARGB(255, 223, 223, 223)),
        child: const Icon(Icons.cloud_upload_outlined),
      ),
    ));
    update();
  }
}
