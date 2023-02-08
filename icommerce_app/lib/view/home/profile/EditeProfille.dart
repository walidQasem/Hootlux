import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/controller/home/profil/EditprofileController.dart';
import 'package:widget/main.dart';

import '../../../function/validInput.dart';
import '../../../shared/appBar.dart';
import '../../../shared/hieght.dart';
import '../../../shared/textFild.dart';

class EditeProfile extends GetView<EditProfilController> {
  const EditeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfilController controllere = Get.put(EditProfilController());
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appbarfunction("Edit Profile"),
        body: SingleChildScrollView(
          child: Form(
            key: controller.forme,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(255, 233, 233, 233),
                        ),
                        child: GetBuilder<EditProfilController>(builder: (cee) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: cee.image == null
                                ? shardp!.getString("imageUser") != ""
                                    ? Image.network(
                                        "$root/ecommerce/image/${shardp!.getString("imageUser").toString()}",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        "https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1673440012~exp=1673440612~hmac=b9679852a205a0d2dc6a01ec23f0ed92786fd3f89cd1d2a74d547c2dbaf96153",
                                        fit: BoxFit.cover,
                                      )
                                : Image.file(cee.image!, fit: BoxFit.cover),
                          );
                        }),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ClipOval(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: colorbutton),
                                onPressed: () {
                                  controller.uploadImage();
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                hieght(50),
                Edittext(
                    validator: (val) {
                      return valideInbut(val!, 5, 18, "username");
                    },
                    labele: "",
                    obescure: false,
                    enabel: false,
                    hint: 'Enter your username',
                    icon: const Icon(Icons.edit_outlined),
                    prifixicon:
                        Icon(Icons.person, color: colorbutton, size: 20),
                    controller: controllere.username),
                hieght(20),
                Edittext(
                    validator: (val) {
                      return valideInbut(val!, 5, 18, "email");
                    },
                    enabel: true,
                    labele: "",
                    obescure: false,
                    hint: 'Enter your Email',
                    prifixicon: Icon(
                      Icons.email,
                      color: colorbutton,
                      size: 20,
                    ),
                    controller: controllere.email),
                hieght(20),
                Edittext(
                    validator: (val) {
                      return valideInbut(val!, 5, 18, "phone");
                    },
                    labele: "",
                    obescure: false,
                    enabel: false,
                    hint: 'Enter your phone',
                    type: "phone",
                    icon: const Icon(Icons.edit_outlined),
                    prifixicon: Icon(
                      Icons.phone,
                      color: colorbutton,
                      size: 20,
                    ),
                    controller: controllere.phone),
                hieght(30),
                SizedBox(
                  height: 55,
                  width: w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: ElevatedButton.icon(
                      style: TextButton.styleFrom(backgroundColor: colorbutton),
                      onPressed: () {
                        controller.save();
                        controller.upload();
                      },
                      icon: const Icon(
                        Icons.save_as_outlined,
                        size: 24.0,
                      ),
                      label: const Text(
                        'Save',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: "cairo"),
                      ), // <-- Text
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
