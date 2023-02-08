import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:widget/class/hotel/GaneratData.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/function/chnageStatuReq.dart';
import 'package:widget/main.dart';
import 'package:widget/view/auth/singin.dart';
import 'package:widget/widget/dashboard/homeDash1.dart';

import '../../widget/dashboard/Concierge.dart';
import '../../widget/dashboard/Riservation.dart';
import '../../widget/dashboard/desktop.dart';

class DashBoardController extends GetxController {
  Favorite_data f = Favorite_data(Get.find());
  late int index = 0;
  late int indexListe = 0;
  late List dataBasice = [];
  List data = [];
  List hotels = [];
  List dataList = [];
  List info = [];
  List concierge = [];
  late StatusRequest st = StatusRequest.loading;
  late StatusRequest ifo = StatusRequest.loading;
  late TextEditingController email, password, phone, name;

  List<String> listst = ["Currently", "Completed", "Canceled"];

  List<Widget> listwd = [];

  lol() {
    if (shardp!.getString("role") == "admin") {
      listwd.addAll([
        const HomeDash1(),
        const DesktopD(),
        const Hotels(),
        const Concierge(),
        IconButton(
            onPressed: () {
              Get.to(() => const Singin());
            },
            icon: const Icon(Icons.logout)),
      ]);
    } else {
      listwd.addAll([
        const DesktopD(),
        IconButton(
            onPressed: () {
              Get.to(() => const Singin());
            },
            icon: const Icon(Icons.logout)),
      ]);
    }
  }

  getHotels() async {
    var response = await f.getHotels();
    st = chnageStatuReq(response);
    if (st == StatusRequest.success) {
      if (response["message"] == true) {
        hotels.addAll(response["data"]);
      }
    }

    update();
  }

  changeIndex(int i) {
    indexListe = i;
    dataBasice = [];
    if (listst[indexListe] == "Canceled") {
      for (int i = 0; i < data.length; i++) {
        if (data[i]["status"] == "Canceled") {
          dataBasice.addAll([data[i]]);
        }
      }
    }

    if (listst[indexListe] == "Completed") {
      List dataList = [];
      for (int i = 0; i < data.length; i++) {
        if (data[i]["status"] == "Completed") {
          dataBasice.addAll([data[i]]);
        }
      }
    }
    if (listst[indexListe] == "Currently") {
      List dataList = [];
      for (int i = 0; i < data.length; i++) {
        if (data[i]["status"] == "Currently") {
          dataBasice.addAll([data[i]]);
        }
      }
    }

    update();
  }

  RefreshController r = RefreshController(initialRefresh: true);

  chnage(int i) {
    index = i;
    update();
  }

  remove(int s) {
    dataBasice.removeAt(s);
    info.removeAt(s);
    update();
  }

  get_data() async {
    getInfo();
    await Future.delayed(const Duration(seconds: 2));
    var response = await f.getBookingDashboard();
    st = chnageStatuReq(response);
    if (st == StatusRequest.success) {
      data = [];
      dataBasice = [];
      if (response["data"] != null) {
        data.addAll(response["data"]);
      }
    }

    for (int i = 0; i < data.length; i++) {
      if (data[i]["status"] == "Currently") {
        dataBasice.addAll([data[i]]);
      }
    }

    print(info);
    r.refreshCompleted();

    update();
  }

  getInfo() async {
    var response = await f.getInfoUserDashboard("73");
    ifo = chnageStatuReq(response);
    if (ifo == StatusRequest.success) {
      info = [];
      if (response["data"] != null) {
        info.addAll(response["data"]);
      }
    }
    r.refreshCompleted();
    update();
  }

  uploadStatus(String id, String status) async {
    var response = await f.updatStatus(id, status);

    if (response["message"] == true) {
      get_data();
      getInfo();
    }

    update();
  }

  getConcierge() async {
    var reponse = await f.getConcierge();
    if (reponse["message"] == true) {
      concierge.addAll(reponse["data"]);
    }
  }

  addConcierge() async {
    var reponse = await f.addconcierge(
        name.text.toString(), email.text, phone.text, phone.text);
    if (reponse["message"] == true) {
      Get.snackbar("walkid", "ok");
    } else {
      Get.snackbar("walid", "");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    email = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();

    lol();
    getConcierge();
    get_data();
    getHotels();
    super.onInit();
  }
}
