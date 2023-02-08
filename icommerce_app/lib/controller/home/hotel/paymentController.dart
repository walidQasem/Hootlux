import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/view/home/booking/Payment%20confirmation.dart';

import '../../../view/home/booking/card.dart';

class PaymentController extends GetxController {
  String? ntroGroup;
  changeRadioGroup(String val) {
    ntroGroup = val;
    update();
  }

  toPageCard() {
    if (ntroGroup == "Another Card") {
      Get.to(() => const PaymentConfomation());
    } else {
      Get.rawSnackbar(
        icon: const Icon(
          Icons.dangerous_outlined,
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(10),
        title: "message",
        message: "Payment is not available $ntroGroup",
        backgroundColor: const Color.fromARGB(255, 115, 115, 115),
        borderRadius: 22,
      );
    }
  }

  @override
  void onInit() async {
    var res = await Connectivity().checkConnectivity();
    if (res == ConnectivityResult.none) {
      print("non");
    } else {
      print("oui");
    }

    super.onInit();
  }
}
