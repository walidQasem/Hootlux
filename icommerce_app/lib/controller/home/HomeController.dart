import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:widget/class/crud.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/data/remote/addFavorite.dart';
import 'package:widget/main.dart';

import '../../class/hotel/listeCatigory.dart';
import '../../data/remote/GetHotel.dart';
import '../../function/chnageStatuReq.dart';

class HomeController extends GetxController {
  int indexPage = 0;
  int indexCategory = 0;
  echange(int x) {
    indexPage = x;
    
    update();
  }

  List<String> listeCatigory = ["13".tr, "14".tr, "15".tr];
  chnageIndexCategory(int i) {
    indexCategory = i;
    update();
  }

  Icon icon = const Icon(Icons.favorite_border_outlined);
  chnageIcon(Icon s) {
    icon = s;
    update();
  }

  GetHotel s = GetHotel(Get.find());

  List data = [];
  List hotelVille = [];
  List hightestRated = [];
  List common = [];
  late StatusRequest statusRequest;

  Future<void> getdata() async {
    statusRequest = StatusRequest.loading;
    await Future.delayed(const Duration(seconds: 2));
    var response = await s.getdata();
    statusRequest = chnageStatuReq(response);
    if (statusRequest == StatusRequest.success) {
      data.addAll(response['data']);
      for (int i = 0; i < data.length; i++) {
        if (data[i]['ville_Hotel'] == "safi") {
          hotelVille.addAll([data[i]]);
        }
        if (data[i]['rating'] > 5) {
          hightestRated.addAll([data[i]]);
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
