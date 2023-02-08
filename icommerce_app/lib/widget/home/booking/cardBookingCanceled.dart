import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/model/Hotel/Hotel_Model.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/shared/text.dart';

import '../../../controller/home/hotel/data_Booking.dart';

class CardBookingCanceled extends StatelessWidget {
  final Data_Class_Hotel hotel;

  const CardBookingCanceled({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    List imge = jsonDecode(hotel.imgHotel.toString());
    Boking_Data_Controller cc = Get.put(Boking_Data_Controller());
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Stack(
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  "$root/ecommerce/image/${imge[0].toString()}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                left: 145,
                top: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        hotel.nomHotel.toString(),
                        isblack(Colors.white, Colors.black),
                        18,
                        FontWeight.bold),
                    text(
                        hotel.villeHotel.toString(),
                        const Color.fromARGB(255, 198, 198, 198),
                        12,
                        FontWeight.bold),
                    hieght(10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color.fromARGB(255, 255, 113, 81)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 2),
                      width: 140,
                      height: 25,
                      child: Center(
                        child: text(
                            "This hotel has been cancelled",
                            const Color.fromARGB(255, 233, 233, 233),
                            10,
                            FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
