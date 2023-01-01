import 'package:get/get.dart';
import 'package:widget/class/crud.dart';
import 'package:widget/constant/rooteNamed.dart';
import 'package:widget/constant/url.dart';

class VerificationForgetPasswordController extends GetxController {
  String? email;
  onvirifier(String code) async {
    var response = await postdata(verificationCodeForgetpassword,
        {"email_user": email, "code_verification":code});

    if (response['message'] == true) {
      Get.toNamed(Approot.resetPassword,arguments:{"email":email});
    } else {
      Get.snackbar("ne pas bien", " ne pas bien");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['emaile'];
    super.onInit();
  }
}
