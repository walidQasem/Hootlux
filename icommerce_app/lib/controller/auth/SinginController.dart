import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/main.dart';
import 'package:widget/view/auth/singup.dart';
import 'package:widget/view/dashboard/home1Dash.dart';
import 'package:widget/view/dashboard/homeDash.dart';
import 'package:widget/view/home/homeApp.dart';
import '../../class/crud.dart';

class SinginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> form = GlobalKey<FormState>();
  late Icon icon = const Icon(Icons.remove_red_eye);
  bool obs = true;
  bool? checkInter;
  bool isloading = false;

  testlogin() async {
    isloading = true;
    await Future.delayed(const Duration(seconds: 3));
    var response = await postdata(
        loginuser, {"email_user": email.text, "password": password.text});
    if (response['message'] == true) {
      isloading = false;
      shardp!.setString("id", response["data"]['id_user'].toString());
      shardp!.setString("username", response["data"]['username_user']);
      shardp!.setString("emailKey", response["data"]['email_user']);
      shardp!.setString("phone", response["data"]['phone_user']);
      shardp!.setString("imageUser", response["data"]['img_user']);
      shardp!.setString("role", response["data"]['role']);
      if (response["data"]['role'] == "admin" ||
          response["data"]['role'] == "Recipient") {
        Get.offAll(() => const Home1Dash());
      }

      if (response["data"]['role'] == "client") {
        Get.offAll(() => const HomeApp());
      }
    } else {
      isloading = false;
      Get.defaultDialog(
          title: "Error200", middleText: "This account does not exist");
    }
    update();
  }

  enchangeObsucr() {
    if (obs == true) {
      obs = false;
      icon = const Icon(Icons.remove);
    } else {
      obs = true;
      icon = const Icon(Icons.remove_red_eye);
    }
    update();
  }

  singup() {
    Get.to(
      () => const Singup(),
      transition: Transition.leftToRight,
    );
  }

  singin() {
    // ignore: unused_local_variable
    var formdata = form.currentState;
    if (formdata!.validate()) {
      testlogin();
    } else {
      HapticFeedback.vibrate();
    }
    update();
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print("dddddddddddddd");
    //   print(value);
    //   String? token = value;
    // });

    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }
}
