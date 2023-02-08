import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/controller/home/hotel/FavoriteController.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/text.dart';

import '../../../model/Hotel/Hotel_Model.dart';
import '../../../shared/isBlack.dart';
import '../../../view/home/homepage/details.dart';

class CardSearchHotel extends GetView<FavoriteController> {
  final Data_Class_Hotel dataHotel;
  const CardSearchHotel({
    super.key,
    required this.dataHotel,
  });
  @override
  Widget build(BuildContext context) {
    List imge = jsonDecode(dataHotel.imgHotel.toString());
    return InkWell(
      onTap: () {
        Get.to(() => const DetailsHotel(),
            arguments: {
              "id": dataHotel.idHotel.toString(),
              "description": dataHotel.descriptionHotel,
              "rating": dataHotel.rating,
              "img": dataHotel.imgHotel.toString(),
              "price": dataHotel.price.toString(),
              "longitude": dataHotel.longitude,
              "latitude": dataHotel.latitude,
              "situations": dataHotel.situations,
            },
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500));
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                width: 130,
                height: 130,
                child: AnimatedOpacity(
                  opacity: 0.9,
                  duration: const Duration(milliseconds: 700),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "$root/ecommerce/image/${imge[0].toString()}",
                        width: 120,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        maxLines: 2,
                        dataHotel.nomHotel.toString(),
                        style: const TextStyle(
                            fontFamily: "cairo",
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    hieght(5),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: isblack(
                              const Color.fromARGB(255, 189, 189, 189),
                              const Color.fromARGB(255, 140, 140, 140)),
                          size: 20,
                        ),
                        Text(
                          'safi',
                          style: TextStyle(
                              color: isblack(
                                  const Color.fromARGB(255, 189, 189, 189),
                                  const Color.fromARGB(255, 149, 149, 149))),
                        ),
                      ],
                    ),
                    hieght(10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Color.fromARGB(255, 255, 191, 0),
                          size: 20,
                        ),
                        Text(
                          '4.6',
                          style: TextStyle(
                              color: isblack(
                                  const Color.fromARGB(255, 189, 189, 189),
                                  const Color.fromARGB(255, 149, 149, 149))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
          Positioned(
              right: 10,
              top: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      // controller.del_Fav(dataHotel.idHotel.toString());
                      icon: Icon(
                        Icons.bookmark_add_outlined,
                        color: colorOrange,
                        size: 30,
                      )),
                  hieght(30),
                  Row(
                    children: [
                      text(
                          "${dataHotel.price} Dh",
                          isblack(Colors.white, Colors.black),
                          17,
                          FontWeight.bold),
                      Text('/Night',
                          style: TextStyle(
                              fontSize: 12,
                              color: isblack(
                                  const Color.fromARGB(255, 189, 189, 189),
                                  const Color.fromARGB(255, 139, 139, 139))))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
