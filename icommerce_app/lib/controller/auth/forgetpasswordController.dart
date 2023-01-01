import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:widget/class/crud.dart';
import 'package:widget/view/auth/forgetpassword/verifierCodeForgetPassword.dart';

import '../../constant/url.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController email;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  bool isloading=false;
  validationEmail() async {
    isloading = true;
    await Future.delayed(Duration(seconds: 2));
    var response = await postdata(vaidationEmail, {"email_user": email.text});
    if (response["message"] == true) {
      isloading = false;
      Get.to(() => VerifierCode(), arguments: {"emaile": email.text});
    } else {
      isloading = false;
      Get.snackbar("message", "Email not Exist");
    }
    update();
  }

  obvirefieremail() {
    var formdata = form.currentState;
    if (formdata!.validate()) {
      validationEmail();
    }
    update();
  
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
}
