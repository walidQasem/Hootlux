import 'package:get/get.dart';

class GallryController extends GetxController {
  dynamic imge = "";
  List images = [];
  getId() {
    imge = Get.arguments['images'];
    print(imge);

  }

  @override
  void onInit() {
    getId();

    super.onInit();
  }
}
