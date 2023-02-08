import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/class/hotel/GaneratData.dart';
import 'dart:convert';

import 'package:widget/class/staturequest.dart';
import 'package:widget/function/chnageStatuReq.dart';

import '../../../data/remote/GetHotel.dart';
import '../../../shared/alertD.dart';
import '../../../view/home/booking/booking_date.dart';

class DetailsController extends GetxController {
  late TextEditingController coment;
  late int index = 0;
  late int index1 = 0;

  late String id = "";
  late String price = "";
  List images = [];

  List commntaire = [];
  late FocusNode focus;
  late String description = "";
  late double rating = 1.0;
  late double latitude = 1.0;
  String img = "";
  late double longitude = 1.0;
  late List situations = [];
  GetHotel fav = GetHotel(Get.find());
  Favorite_data bok = Favorite_data(Get.find());
  late StatusRequest statusRequest;
  getdata() {
    id = Get.arguments['id'];
    images = jsonDecode(Get.arguments['img']);
    img = Get.arguments['img'];
    rating = Get.arguments['rating'];
    description = Get.arguments['description'];
    price = Get.arguments['price'];
    longitude = Get.arguments["longitude"];
    latitude = Get.arguments["latitude"];
    situations = jsonDecode(Get.arguments["situations"]);
  }

  changeIndexC(int x) {
    index1 = x;
    update();
  }

  changeIndex(int c) {
    index = c;
    update();
  }

  // getImages() async {
  //   statusRequest = StatusRequest.loading;
  //   var resposne = await fav.getImages(id);
  //   statusRequest = chnageStatuReq(resposne);
  //   if (statusRequest == StatusRequest.success) {
  //     if (resposne['message'] == true) {
  //       images.addAll(resposne['data']);
  //     } else {
  //       return null;
  //     }
  //   }
  //   update();
  // }

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

  is_booking() async {
    statusRequest = StatusRequest.loading;
    var response = await bok.is_Booking(id.toString());
    statusRequest = chnageStatuReq(response);
    if (statusRequest == StatusRequest.success) {
      if (response["message"] == true &&
          response["data"]["status"] == "Currenty") {
        alertD(() {
          Get.back();
        }, () {
          Get.back();
        },
            "Pre-booked",
            "If you have previously booked, you can cancel the reservation from the reservations and re-book another",
            "",
            "Yes,Follower",
            "Cancel");
      } else {
        Get.to(() => const Bookingdate(), arguments: {
          "img": Get.arguments['img'].toString(),
          "idHotel": id.toString(),
          "price": price.toString()
        });
      }
    }
  }

  @override
  void onInit() {
    focus = FocusNode();
    coment = TextEditingController();
    getdata();
    getCommantaire();
    // getImages();

    super.onInit();
  }
}
