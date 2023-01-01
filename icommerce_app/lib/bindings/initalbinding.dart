
import 'package:get/get.dart';
import 'package:widget/class/Crude.dart';

class InitalBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crude());
  }
}
