import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:widget/class/hotel/GaneratData.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/function/chnageStatuReq.dart';

// ignore: camel_case_types
class Boking_Data_Controller extends GetxController {
  List<String> listeCat = ["Currently", "Completed", "Canceled"];
  int index = 0;
  List data = [];
  List dataBooking = [];
  List dataBokingCurrenty = [];
  List dataBokingComplted = [];
  List dataBokingCancel = [];
  StatusRequest? statusRequest;
  Favorite_data f = Favorite_data(Get.find());
  RefreshController refController = RefreshController(initialRefresh: true);

  chnageIndex(int i) {
    index = i;
    if (i == 1) {
      dataBooking = [];
      for (int i = 0; i < dataBokingComplted.length; i++) {
        dataBooking.addAll([dataBokingComplted[i]]);
      }
    }

    if (i == 0) {
      dataBooking = [];
      for (int i = 0; i < dataBokingCurrenty.length; i++) {
        dataBooking.addAll([dataBokingCurrenty[i]]);
      }
    }
    if (i == 2) {
      dataBooking = [];
      for (int i = 0; i < dataBokingCancel.length; i++) {
        dataBooking.addAll([dataBokingCancel[i]]);
      }
    }
    update();
  }

  remove_booking(int id) {
    for (int i = 0; i < dataBooking.length; i++) {
      if (dataBooking[i]['id_hotel'] == id) {
        dataBooking.removeAt(i);
      }
    }
    update();
  }

  Future<void> get_data() async {
    statusRequest = StatusRequest.loading;
    await Future.delayed(const Duration(seconds: 1));
    var response = await f.get_Booking();
    statusRequest = chnageStatuReq(response);
    if (statusRequest == StatusRequest.success) {
      dataBooking = [];
      dataBokingCancel = [];
      dataBokingComplted = [];
      dataBokingCurrenty = [];
      index = 0;
      data = [];
      if (response['message'] == true) {
        data.addAll(response["data"]);

        for (int i = 0; i < data.length; i++) {
          if (data[i]["status"] == "Currently") {
            dataBooking.addAll([data[i]]);
            dataBokingCurrenty.addAll([data[i]]);
          }
        }

        for (int i = 0; i < data.length; i++) {
          if (data[i]["status"] == "Completed") {
            dataBokingComplted.addAll([data[i]]);
          }
        }
        for (int i = 0; i < data.length; i++) {
          if (data[i]["status"] == "Canceled") {
            dataBokingCancel.addAll([data[i]]);
          }
        }
      }
      refController.refreshCompleted();
      update();
    }
  }

  deletBooking(String id) async {
    statusRequest = StatusRequest.loading;
    var response = await f.deleteBooking(id);
    statusRequest = chnageStatuReq(response);

    update();
  }

  @override
  void onInit() {
    get_data();
    super.onInit();
  }
}
