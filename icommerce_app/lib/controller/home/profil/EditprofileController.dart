import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widget/class/crud.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/main.dart';

import '../../../class/hotel/GaneratData.dart';

class EditProfilController extends GetxController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  GlobalKey<FormState> forme = GlobalKey<FormState>();
  Favorite_data ff = Favorite_data(Get.find());
  File? image;
  dynamic? encode;
  dynamic? splitename;
  var pickfile = ImagePicker();

  uploadImage() async {
    // ignore: deprecated_member_use
    var pickeImgae = await pickfile.getImage(source: ImageSource.camera);
    if (pickeImgae != null) {
      image = File(pickeImgae.path);
    }
    update();
  }

  Future upload() async {
    if (image == null) return;
    encode = base64Encode(image!.readAsBytesSync());
    splitename = image!.path.split("/").last;
    

    var re = await ff.uploadImage(splitename, encode);
    if (re["messgae"] == true) {
      shardp!.setString("imageUser", splitename.toString());
    }
  }

  edit() async {
    var respone = await postdata(editProfile, {
      "id_user": shardp!.getString("id").toString(),
      "username_user": username.text,
      "phone_user": phone.text,
    });
    shardp!.setString("username", username.text);
    shardp!.setString("phone", phone.text);
    if (respone["message"] == true) {
      Get.snackbar("Message", "The modification was completed successfully",
          icon: const Icon(Icons.checklist_sharp),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20));
    } else {}
    print(shardp!.getString("id").toString());
  }

  save() {
    var formdata = forme.currentState;
    if (formdata!.validate()) {
      edit();
      Get.back();
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
