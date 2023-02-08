import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/home/hotel/bookignController.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/button.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/widget/home/booking/TableWidget.dart';
import 'package:widget/widget/home/homePage/card_Hotel_Search.dart';

import '../../../constant/color.dart';
import '../../../model/Hotel/Hotel_Model.dart';

class PaymentConfomation extends StatelessWidget {
  const PaymentConfomation({super.key});

  @override
  Widget build(BuildContext context) {
    BookingController bok = Get.put(BookingController());
    List images = jsonDecode(bok.img.toString());
    return Scaffold(
      appBar: appbarfunction("PaymentConfomation"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 0.1,
                          color: isblack(
                              const Color.fromARGB(255, 251, 248, 248),
                              const Color.fromARGB(255, 0, 0, 0))))),
              child: CardSearchHotel(
                  dataHotel: Data_Class_Hotel(
                idHotel: 1,
                descriptionHotel: "coooooool",
                favorite: 1,
                emailHotel: "",
                nomHotel: "Hotel Farah HG",
                numHotel: "azd",
                price: 2000,
                rating: 6.5,
                villeHotel: "azd",
                imgHotel: bok.img.toString(),
              )),
            ),
            hieght(50),
            TbaleWidget(
              title: 'From Date',
              values:
                  "${bok.stratDate!.day.toString()}/${bok.stratDate!.month.toString()}/${bok.stratDate!.year.toString()}",
            ),
            hieght(20),
            TbaleWidget(
              title: 'to Date',
              values:
                  "${bok.endDate!.day.toString()}/${bok.endDate!.month.toString()}/${bok.endDate!.year.toString()}",
            ),
            hieght(20),
            TbaleWidget(
              title: 'number of children',
              values: bok.indexEfant.toString(),
            ),
            hieght(20),
            TbaleWidget(
              title: 'number of adults',
              values: bok.indexdult.toString(),
            ),
            hieght(20),
            TbaleWidget(
              title: 'Total',
              values: bok.some.toString(),
            ),
            hieght(70),
            GetBuilder<BookingController>(builder: (con) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 14),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            width: 0.1,
                            color: isblack(
                                const Color.fromARGB(255, 251, 248, 248),
                                const Color.fromARGB(255, 0, 0, 0))))),
                child: ButtonFun(
                    "Payment confirmation", colorbutton, double.infinity, 60,
                    () {
                  con.bookingAdd();
                }, null, const Icon(Icons.confirmation_num_outlined), null),
              );
            }),
          ],
        ),
      ),
    );
  }
}
