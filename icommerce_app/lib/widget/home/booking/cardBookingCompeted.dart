import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/model/Hotel/Hotel_Model.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/shared/text.dart';

import '../../../controller/home/hotel/data_Booking.dart';

class CardBookingCompleted extends StatelessWidget {
  final Data_Class_Hotel hotel;

  const CardBookingCompleted({super.key, required this.hotel});

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
                          color: const Color.fromARGB(255, 226, 253, 228)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 2),
                      width: 65,
                      height: 25,
                      child: Center(
                        child: text(
                            "was accepted",
                            const Color.fromARGB(255, 0, 105, 19),
                            10,
                            FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            Positioned(
              right: 0,
              top: 20,
              child: Column(
                children: [
                  Container(
                    height: 37,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: MaterialButton(
                        color: colorbutton,
                        onPressed: () {},
                        child: text(
                            "show Ticket", Colors.white, 11, FontWeight.bold),
                      ),
                    ),
                  ),
                  hieght(12),
                  Container(
                    height: 37,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: MaterialButton(
                        color: const Color.fromARGB(255, 230, 230, 255),
                        onPressed: () {
                          cc.remove_booking(
                              int.parse(hotel.idHotel.toString()));
                        },
                        child: text(
                            "Hotel rating", colorbutton, 11, FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
