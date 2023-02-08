import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/class/staturequest.dart';

import '../../../class/hotel/GaneratData.dart';
import '../../../function/chnageStatuReq.dart';
import '../../../main.dart';

class FavoriteController extends GetxController {
  Map favorite = {};
  Favorite_data fav_data = Favorite_data(Get.find());
  setFavodrite(id, val) {
    favorite[id] = val;
    update();
  }

  late StatusRequest statusRequest;

  add_Fav(String idHotel) async {
    statusRequest = StatusRequest.loading;
    var response =
        await fav_data.add_Fav(idHotel, shardp!.getString("id").toString());
    statusRequest = chnageStatuReq(response);
    if (statusRequest == StatusRequest.success) {
      Get.rawSnackbar(
        icon: const Icon(
          Icons.add_task_rounded,
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(10),
        title: "message",
        message: "Added successfully",
        backgroundColor: const Color.fromARGB(255, 115, 115, 115),
        borderRadius: 22,
      );
    }
  }

  del_Fav(String idHotel) async {
    statusRequest = StatusRequest.loading;
    var response =
        await fav_data.del_Fav(idHotel, shardp!.getString("id").toString());
    statusRequest = chnageStatuReq(response);
    if (statusRequest == StatusRequest.success) {
      Get.rawSnackbar(
        icon: const Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(10),
        title: "message",
        message: "Delete completed successfully",
        backgroundColor: const Color.fromARGB(255, 115, 115, 115),
        borderRadius: 22,
      );
    }
  }
}
