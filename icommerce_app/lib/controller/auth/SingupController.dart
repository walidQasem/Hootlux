import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widget/class/crud.dart';
import 'dart:io';
import '../../constant/url.dart';
import '../../view/auth/singin.dart';
import '../../view/auth/verifycodeSingup.dart';

class SingUpController extends GetxController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController role;

  late Icon icon = const Icon(Icons.remove_red_eye);
  GlobalKey<FormState> formSingup = GlobalKey<FormState>();
  bool isloading = false;

  var image;
  final pickedfile = ImagePicker();

  updload() async {
    var pimage = await pickedfile.getImage(source: ImageSource.camera);
    if (pimage != null) {
      image = File(pimage.path);
    } else {}
    update();
  }

  singupform() async {
    isloading = true;
    await Future.delayed(const Duration(seconds: 3));
    var response = await postdata(addUser, {
      "username_user": username.text,
      "email_user": email.text,
      "phone_user": phone.text,
      "password": password.text,
      "role": role.text
    });
    if (response['message'] == false) {
      isloading = false;
      Get.snackbar("message", "email deja fait!!",
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15));
    } else {
      isloading = false;
      Get.to(() => const VerfiyCodeSingup(), arguments: {"email": email.text});
    }
    update();
  }

  onverifycode() {
    var formdata = formSingup.currentState;
    if (formdata!.validate()) {
      singupform();
    } else {
      HapticFeedback.vibrate();
    }
    update();
  }

  singin() {
    Get.offAll(() => const Singin(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 700));
  }

  bool obs = true;
  echangeObsucr() {
    if (obs == true) {
      obs = false;
      icon = const Icon(Icons.remove);
    } else {
      obs = true;
      icon = const Icon(Icons.remove_red_eye);
    }
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    role = TextEditingController();

    super.onInit();
  }
}
