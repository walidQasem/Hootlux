import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/model/Hotel/Hotel_Model.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/home/booking/addHotel.dart';
import 'package:widget/widget/dashboard/resirvationHotel.dart';

import '../../class/staturequest.dart';
import '../../controller/dashboard/dashboardController.dart';
import '../../shared/button.dart';
import '../../shared/isBlack.dart';
import '../../shared/text.dart';
import 'Card_Hotel_dash.dart';

class Hotels extends StatelessWidget {
  const Hotels({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (cont) {
      if (cont.st == StatusRequest.success && cont.hotels.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 194, 206, 255),
                  ),
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      ...List.generate(cont.hotels.length, (index) {
                        return InkWell(
                          onTap: () {
                            const Resirvation();
                          },
                          child: Card_Hotel_dash(
                              dataHotel: Data_Class_Hotel.fromJson(
                                  cont.hotels[index])),
                        );
                      })
                    ],
                  )),
              hieght(20),
              ButtonFun(
                  "Add Hotel  ",
                  isblack(
                      const Color.fromARGB(255, 255, 255, 255), colorbutton),
                  double.infinity,
                  50, () {
                Get.to(() => const AddHotel());
              },
                  isblack(const Color.fromARGB(255, 204, 204, 204),
                      const Color.fromARGB(255, 255, 255, 255)),
                  Icon(
                    Icons.add_circle_outline_outlined,
                    color: isblack(const Color.fromARGB(255, 204, 204, 204),
                        const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  null),
            ],
          ),
        );
      } else {
        return Column(
          children: [
            hieght(120),
            Image.asset(
              "images/avatar.png",
              width: 400,
            ),
            text("No Information", const Color.fromARGB(255, 139, 166, 255), 25,
                FontWeight.bold),
          ],
        );
      }
    });
  }
}
