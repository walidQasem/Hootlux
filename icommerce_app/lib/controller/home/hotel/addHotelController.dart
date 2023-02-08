// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widget/class/hotel/GaneratData.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/function/chnageStatuReq.dart';

class AddHotelController extends GetxController {
  late TextEditingController name_Hotel;
  late TextEditingController desc_Hotel;
  late TextEditingController phone_Hotel;
  late TextEditingController email_Hotel;
  late TextEditingController rating_Hotel;
  late double lalitude = 31.792305849269;
  late double longitude = -7.080168000000015;
  getMap(double lat, double log) {
    lalitude = lat;
    longitude = log;
    update();
  }

  late TextEditingController price_Hotel;
  GlobalKey<FormState> form = GlobalKey<FormState>();
  List<String> listVille = [
    "Safi",
    "Agadir",
    "tanger",
    "casablanca",
    "hociema",
    "fes",
    "maknesse",
    "Tiznit",
    "dakhla",
    "smara",
    "tata",
    "figig",
    "jdida",
    "sale",
    "Rabat",
    "Mohamadia",
    "ksar sghir",
    "titwan"
  ];
  late String ville = listVille[0].toString();
  var pickfile = ImagePicker();
  Favorite_data ff = Favorite_data(Get.find());
  late List<File> image = [];
  late List<String> nameImgae = [];
  uploadGallry() async {
    // ignore: deprecated_member_use
    var pickeImgae = await pickfile.getImage(source: ImageSource.gallery);
    if (pickeImgae != null) {
      image.add(File(pickeImgae.path));
    }
    print(image);
    update();
  }

  isvalide() {
    var formdata = form.currentState;
    if (formdata!.validate() && tags.isNotEmpty && image.isNotEmpty) {
      addHotel();
    } else {
      if (image.isEmpty) {
        Get.snackbar("valide images", "message");
      }
      HapticFeedback.vibrate();
    }
  }

  uploadCamera() async {
    // ignore: deprecated_member_use
    var pickeImgae = await pickfile.getImage(source: ImageSource.camera);
    if (pickeImgae != null) {
      image.add(File(pickeImgae.path));
    }
    print(image);
    update();
  }

  onchange(String v) {
    ville = v;
    update();
  }

  upload() async {
    String splitename;
    for (int i = 0; i < image.length; i++) {
      var encode = base64Encode(image[i].readAsBytesSync());
      splitename = image[i].path.split("/").last;

      var re = await ff.uploadImage(splitename, encode);
    }
  }

  List<String> tags = [];
  List<String> option = [];
  Favorite_data f = Favorite_data(Get.find());
  late StatusRequest ss;
  late StatusRequest add;
  chnage(List<String> i) {
    tags = i;
    update();
  }

  getFaviliry() async {
    ss = StatusRequest.loading;
    var reposnse = await f.getFacility();
    ss = chnageStatuReq(reposnse);
    if (ss == StatusRequest.success) {
      for (int i = 0; i < reposnse["data"].length; i++) {
        option.addAll([reposnse["data"][i]["situations"]]);
      }
    }
    update();
  }

  deleteImgaes(File f, int i) {
    image.remove(f);
    nameImgae.remove(f.path.split("/").last);
    update();
  }

  addHotel() async {
    for (int i = 0; i < image.length; i++) {
      nameImgae.add(image[i].path.split("/").last);
    }
    add = StatusRequest.loading;
    var reposnse = await f.addHotel(
        name_Hotel.text,
        desc_Hotel.text,
        phone_Hotel.text,
        rating_Hotel.text,
        jsonEncode(nameImgae),
        longitude.toString(),
        lalitude.toString(),
        "safi",
        email_Hotel.text,
        jsonEncode(tags),
        "88",
        price_Hotel.text);
    add = chnageStatuReq(reposnse);
    if (add == StatusRequest.success) {
      if (reposnse["message"] == true) {
        Get.snackbar("ok", "ok");
      }
    }
  }

  @override
  void onInit() {
    name_Hotel = TextEditingController();
    desc_Hotel = TextEditingController();
    phone_Hotel = TextEditingController();
    email_Hotel = TextEditingController();
    rating_Hotel = TextEditingController();
    price_Hotel = TextEditingController();
    getFaviliry();
    super.onInit();
  }
}
