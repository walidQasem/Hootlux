import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/main.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/home/profile/EditeProfille.dart';
import 'package:widget/controller/home/profil/profileController.dart';
import 'package:widget/view/home/profile/Favorite.dart';
import 'package:widget/view/home/profile/setting.dart';

import '../../../widget/home/profile/inkwil.dart';

class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    ProfilController controP = Get.put(ProfilController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ListView(
        children: [
          Column(children: [
            Center(
                child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 233, 233, 233),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: shardp!.getString("imageUser") != ""
                    ? Image.network(
                        "$root/ecommerce/image/${shardp!.getString("imageUser").toString()}",
                        fit: BoxFit.cover,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                          return child;
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Shimmer.fromColors(
                              baseColor: shardp!.getString("themeColor") ==
                                      "ThemeData#7e127"
                                  ? const Color.fromARGB(255, 95, 95, 95)
                                  : const Color.fromARGB(255, 226, 226, 226),
                              highlightColor: shardp!.getString("themeColor") ==
                                      "ThemeData#7e127"
                                  ? const Color.fromARGB(255, 119, 119, 119)
                                  : const Color.fromARGB(255, 203, 203, 203),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.grey,
                              ),
                            );
                          }
                        },
                      )
                    : Image.network(
                        "https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1673440012~exp=1673440612~hmac=b9679852a205a0d2dc6a01ec23f0ed92786fd3f89cd1d2a74d547c2dbaf96153",
                        fit: BoxFit.cover,
                      ),
              ),
            )),
            hieght(10),
            Text(shardp!.getString("username").toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontFamily: "cairo")),
            hieght(40),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Stack(children: [
                Icon(
                  Icons.nights_stay_sharp,
                  color: colorbutton,
                ),
                Positioned(
                  left: 50,
                  child: Text("11".tr,
                      style: const TextStyle(
                          fontFamily: "cairo",
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Positioned(
                    right: 11,
                    top: -10,
                    child: GetBuilder<ProfilController>(
                        init: ProfilController(),
                        builder: (cont) {
                          return Switch(
                              activeColor: colorbutton,
                              inactiveTrackColor:
                                  const Color.fromARGB(255, 211, 211, 211),
                              value: shardp!.getString("themeColor") ==
                                      "ThemeData#7e127"
                                  ? true
                                  : false,
                              onChanged: (x) {
                                cont.onchangeSwitch(x);
                              });
                        }))
              ]),
            ),
            hieght(35),
            inkWell(
                Icon(
                  Icons.edit_outlined,
                  color: colorbutton,
                ),
                "9".tr, () {
              Get.to(() => const EditeProfile(),
                  transition: Transition.rightToLeftWithFade);
            }),
            hieght(35),
            inkWell(Icon(Icons.settings, color: colorbutton), "5".tr, () {
              Get.to(() => const Setting());
            }),
            hieght(35),
            inkWell(Icon(Icons.notifications_none_sharp, color: colorbutton),
                "6".tr, () {}),
            hieght(35),
            inkWell(Icon(Icons.favorite_border, color: colorbutton), "7".tr,
                () {
              Get.to(() => const Favorite(),
                  transition: Transition.rightToLeftWithFade);
            }),
            hieght(35),
            inkWell(Icon(Icons.help_center_outlined, color: colorbutton),
                "8".tr, () {}),
            hieght(35),
            inkWell(Icon(Icons.login, color: colorbutton), "10".tr, () {
              controP.logout();
            })
          ]),
        ],
      ),
    );
  }
}
