import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/HomeController.dart';
import 'package:widget/shared/isBlack.dart';

import '../../../shared/hieght.dart';

class CatigoriesWidget extends StatelessWidget {
  const CatigoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeC = Get.put(HomeController());
    PageController catr = PageController(
      initialPage: 1,
      viewportFraction: 0.3,
    );

    return GetBuilder<HomeController>(builder: (cont) {
      return SizedBox(
          width: 0,
          height: 60,
          child: PageView.builder(
              controller: catr,
              itemCount: cont.listeCatigory.length,
              itemBuilder: (contex, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: InkWell(
                      child: AnimatedContainer(
                        height: 20,
                        duration: const Duration(seconds: 6),
                        decoration: cont.indexCategory == index
                            ? BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: colorbutton)))
                            : null,
                        child: Center(
                          child: Text(
                            homeC.listeCatigory[index].toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: cont.indexCategory == index
                                    ? colorbutton
                                    : isblack(
                                        const Color.fromARGB(
                                            255, 225, 225, 225),
                                        const Color.fromARGB(255, 94, 94, 94)),
                                fontFamily: "cairo",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        cont.chnageIndexCategory(index);
                      },
                    ),
                  ),
                );
              }));
    });
  }
}
