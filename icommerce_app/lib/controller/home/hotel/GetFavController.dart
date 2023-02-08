import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/function/chnageStatuReq.dart';
import 'package:widget/main.dart';

import '../../../class/hotel/GaneratData.dart';
import '../../../data/remote/addFavorite.dart';

class AfichageFavoriteControllere extends GetxController {
  Addfavrite favdata = Addfavrite(Get.find());

  List fave = [];
  late StatusRequest statusRequist;

  deleteFavInLitst(int idFav) {
    for (int i = 0; i < fave.length; i++) {
      if (fave[i]['id_Hotel'] == idFav) {
        print("oui");
        fave.removeAt(i);
      }
    }
    update();
  }

  aff_Fav() async {
    statusRequist = StatusRequest.loading;
    await Future.delayed(const Duration(seconds: 1));
    var respons = await favdata.getFav(shardp!.getString("id").toString());
    statusRequist = chnageStatuReq(respons);
    if (statusRequist == StatusRequest.success) {
      if (respons['message'] == true) {
        fave.addAll(respons['data']);
      }
    }
    update();
    print("okkkkkkkkkkkkkkkkkkkkkkkk");
  }

  @override
  void onInit() {
    aff_Fav();
    super.onInit();
  }

}
