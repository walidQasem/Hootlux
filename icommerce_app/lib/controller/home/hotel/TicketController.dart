import 'package:get/get.dart';
import 'package:widget/class/hotel/GaneratData.dart';
import 'package:widget/function/chnageStatuReq.dart';

import '../../../class/staturequest.dart';

class TicketController extends GetxController {
  String? id_Hotel;
  Favorite_data ff = Favorite_data(Get.find());
  late StatusRequest st;
  String? name = "";
  String nbPhone = "";
  String fromDate = "";
  String toDate = "";
  int nbChilren = 0;
  String hotelname = "";
  getdata() {
    id_Hotel = Get.arguments["id_Hotel"];
  }

  getdataBs() async {
    st = StatusRequest.loading;
    await Future.delayed(const Duration(seconds: 3));
    var reposne = await ff.is_Booking(id_Hotel.toString());
    st = chnageStatuReq(reposne);
    if (st == StatusRequest.success) {
      if (reposne["message"] = true) {
        name = reposne["data"]["username_user"];
        nbPhone = reposne["data"]["phone_user"];
        fromDate = reposne["data"]["date_start"];
        toDate = reposne["data"]["date_end"];
        nbChilren = reposne["data"]["Number_of_Children"];
        hotelname = reposne["data"]["nom_Hotel"];
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    getdataBs();
    super.onInit();
  }
}
