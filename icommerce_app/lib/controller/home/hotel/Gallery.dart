import 'package:get/get.dart';
import 'package:widget/data/remote/GetHotel.dart';

import '../../../class/staturequest.dart';
import '../../../function/chnageStatuReq.dart';

class GallryController extends GetxController {
  late String id = "";
  List images = [];
  getId() {
    id = Get.arguments['id'].toString();
    print(id);
    update();
  }

  GetHotel fav = GetHotel(Get.find());
  late StatusRequest statusRequest;

  getImages() async {
    statusRequest = StatusRequest.loading;
    var resposne = await fav.getImages(id.toString());
    statusRequest = chnageStatuReq(resposne);
    if (statusRequest == StatusRequest.success) {
      if (resposne['message'] == true) {
        images.addAll(resposne['data']);
      } else {}
    }

    update();
  }

  @override
  void onInit() {
        getId();
    getImages();

    super.onInit();
  }
}
