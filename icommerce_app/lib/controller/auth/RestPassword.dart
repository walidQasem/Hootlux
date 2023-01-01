import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/class/crud.dart';
import 'package:widget/constant/rooteNamed.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/view/auth/singin.dart';
import 'package:widget/view/home/homeApp.dart';

class RestPasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController confirmpassword;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  bool obs = true;
  String? email;
  echangeObsucr() {
    if (obs == true) {
      obs = false;
    } else {
      obs = true;
    }
    update();
  }

  changepassword() async {
    var formdata = form.currentState;
    if (formdata!.validate()) {
      var respose = await postdata(changepasswordurl, {
        "email": email,
        "password1": password.text,
        "password2": confirmpassword.text
      });
      if (respose['message'] == true) {
        Get.offAll(() => HomeApp());
      } else {
        Get.snackbar("azdza", "adzazd");
      }
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    confirmpassword = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }
}
