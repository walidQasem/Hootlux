import 'package:get/get.dart';

class DetailsControllerDashBoroad extends GetxController {
  String? id;
  getData() {
    id = Get.arguments["id"];
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
