import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/class/crud.dart';
import 'package:widget/constant/rooteNamed.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/view/auth/singin.dart';

class VerificatioSingupController extends GetxController {
 late String email;
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  verificode(String code) async {
    var response = await postdata(
        verifiCode, {"email_user": email, "code_verification": code});
    if (response['message'] == true) {
      Get.offAllNamed(Approot.succesSingup);
    } else {
      Get.snackbar("MessageError", "code incorect");
    }
  }
}
