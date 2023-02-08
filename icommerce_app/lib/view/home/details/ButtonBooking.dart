import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/detailsController.dart';
import 'package:widget/shared/button.dart';
import 'package:widget/shared/isArabic.dart';

import '../../../shared/isBlack.dart';
import '../../../shared/text.dart';

class BokingButoon extends StatelessWidget {
  const BokingButoon({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsController d = Get.put(DetailsController());
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Row(
            children: [
              ButtonFun("Book new", colorbutton, 200, 50, () {
                d.is_booking();
              }, null, const Icon(Icons.monetization_on_outlined), null),
            ],
          ),
          Positioned(
              bottom: 10,
              right: isArabic(220, 10),
              child: Row(
                children: [
                  text(
                      "Night ",
                      isblack(const Color.fromARGB(255, 170, 170, 170),
                          const Color.fromARGB(255, 86, 86, 86)),
                      12,
                      FontWeight.bold),
                  text("/ 1210.00\$", colorbutton, 19, FontWeight.bold),
                ],
              ))
        ],
      ),
    );
  }
}
