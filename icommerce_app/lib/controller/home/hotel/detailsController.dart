import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:widget/class/staturequest.dart';
import 'package:widget/function/chnageStatuReq.dart';

import '../../../data/remote/GetHotel.dart';

class DetailsController extends GetxController {
  late TextEditingController coment;
  late int index = 0;
  late int index1 = 0;

  late String img;
  late String id = "";
  late String price = "";
  List images = [];
  List situation = [];
  List commntaire = [];
  late FocusNode focus;
  late String description = "";
  late double rating = 1.0;

  GetHotel fav = GetHotel(Get.find());
  late StatusRequest statusRequest;
  getdata() {
    id = Get.arguments['id'];
    img = Get.arguments['img'];
    rating = Get.arguments['rating'];
    description = Get.arguments['description'];
    price = Get.arguments['price'];
    
  }

  changeIndexC(int x) {
    index1 = x;
    update();
  }

  changeIndex(int c) {
    index = c;
    update();
  }

  getImages() async {
    statusRequest = StatusRequest.loading;
    var resposne = await fav.getImages(id);
    statusRequest = chnageStatuReq(resposne);
    if (statusRequest == StatusRequest.success) {
      if (resposne['message'] == true) {
        images.addAll(resposne['data']);
      } else {
        return null;
      }
    }
    update();
  }

  getSituation() async {
    statusRequest = StatusRequest.loading;
    var resposne = await fav.getSitutaion(id);
    statusRequest = chnageStatuReq(resposne);
    if (statusRequest == StatusRequest.success) {
      if (resposne['message'] == true) {
        situation.addAll(resposne['data']);
      } else {}
    }
    update();
  }

  getCommantaire() async {
    statusRequest = StatusRequest.loading;
    var resposne = await fav.getCommantaire(id);
    statusRequest = chnageStatuReq(resposne);
    if (statusRequest == StatusRequest.success) {
      if (resposne['message'] == true) {
        commntaire.addAll(resposne['data']);
      } else {
        return null;
      }
    }
    update();
  }

  addCommantaire() async {
    var resposne = await fav.addCommantaire(id, coment.text);

    if (resposne['message'] == true) {
      coment.text = "";
      commntaire = [];

      getCommantaire();
    }
    update();
  }

  @override
  void onInit() {
    focus = FocusNode();
    coment = TextEditingController();
    getdata();
    getCommantaire();
    getSituation();
    getImages();

    super.onInit();
  }
}
