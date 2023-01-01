import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/class/crud.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/main.dart';
import 'package:widget/view/home/profile/EditeProfille.dart';

class EditProfilController extends GetxController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  GlobalKey<FormState> forme = GlobalKey<FormState>();

  edit() async {
    var respone = await postdata(editProfile, {
      "id_user": shardp!.getString("id").toString(),
      "username_user": username.text,
      "phone_user": phone.text,
    });
    shardp!.setString("username",username.text);
    shardp!.setString("phone",phone.text);
    if (respone["message"] == true) {
      Get.snackbar("Message", "The modification was completed successfully",icon:   Icon(Icons.checklist_sharp),margin: EdgeInsets.symmetric(vertical:20,horizontal:20));
    } else {

    }
    print(shardp!.getString("id").toString());
  }

  save() {
    var formdata = forme.currentState;
    if (formdata!.validate()) {
      edit();
      Get.to(() => EditeProfile());
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    username.text = shardp!.getString("username").toString();
    email.text = shardp!.getString("emailKey").toString();
    phone.text = shardp!.getString("phone").toString();
    super.onInit();
  }
}
