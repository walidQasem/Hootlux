import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/data_Booking.dart';
import 'package:widget/model/Hotel/Hotel_Model.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/shared/text.dart';
import 'package:widget/widget/home/booking/cardBookingCanceled.dart';
import 'package:widget/widget/home/booking/cardBookingCardBookingCurrenty.dart';
import 'package:widget/widget/home/booking/cardBookingCompeted.dart';

import '../../../Shimmer/Bookingshimmer.dart';
import '../../../class/staturequest.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    Boking_Data_Controller cc = Get.put(Boking_Data_Controller());
    return SmartRefresher(
      controller: cc.refController,
      onRefresh: () => cc.get_data(),
      header: WaterDropHeader(
        waterDropColor: colorbutton,
        completeDuration: Duration.zero,
      ),
      child: GetBuilder<Boking_Data_Controller>(builder: (cont) {
        return Container(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 10),
              child: GetBuilder<Boking_Data_Controller>(builder: (cont) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(cc.listeCat.length, (i) {
                      return InkWell(
                        onTap: () {
                          cont.chnageIndex(i);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 33),
                          decoration: BoxDecoration(
                              color: cont.index == i
                                  ? colorbutton
                                  : isblack(
                                      const Color.fromARGB(255, 65, 65, 65),
                                      const Color.fromARGB(255, 233, 233, 233)),
                              borderRadius: BorderRadius.circular(5)),
                          child: text(
                              cc.listeCat[i],
                              cont.index == i
                                  ? Colors.white
                                  : isblack(Colors.white,
                                      const Color.fromARGB(255, 67, 67, 67)),
                              12,
                              FontWeight.bold),
                        ),
                      );
                    })
                  ],
                );
              }),
            ),
            hieght(20),
            GetBuilder<Boking_Data_Controller>(builder: (conte) {
              if (conte.statusRequest == StatusRequest.success) {
                if (conte.dataBooking.isEmpty) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/vide.json", width: 150),
                      text(
                          "The page is blank",
                          isblack(Colors.white,
                              const Color.fromARGB(255, 57, 57, 57)),
                          20,
                          FontWeight.bold),
                    ],
                  ));
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 90, left: 5, right: 5),
                    child: ListView(children: [
                      ...List.generate(conte.dataBooking.length, (i) {
                        if (conte.index == 0) {
                          return CardBookingCurrenty(
                            hotel:
                                Data_Class_Hotel.fromJson(conte.dataBooking[i]),
                            id_booking:
                                cc.dataBooking[i]['id_booking'].toString(),
                          );
                        }

                        if (conte.index == 1) {
                          return CardBookingCompleted(
                            hotel:
                                Data_Class_Hotel.fromJson(conte.dataBooking[i]),
                          );
                        }

                        if (conte.index == 2) {
                          return CardBookingCanceled(
                            hotel:
                                Data_Class_Hotel.fromJson(conte.dataBooking[i]),
                          );
                        } else {
                          return const Text("");
                        }
                      })
                    ]),
                  );
                }
              } else {
                return Container(
                  padding: const EdgeInsets.only(top: 90, left: 5, right: 5),
                  child: ListView(
                    children: [
                      ...List.generate(3, (index) {
                        return const Booking_shimmer();
                      })
                    ],
                  ),
                );
              }
            }),
          ],
        ));
      }),
    );
  }
}
