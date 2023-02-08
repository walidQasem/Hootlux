import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/controller/home/hotel/FavoriteController.dart';
import 'package:widget/shared/isBlack.dart';

import '../../../model/Hotel/Hotel_Model.dart';
import '../../../shared/hieght.dart';
import '../../../shared/isArabic.dart';
import '../../../view/home/homepage/details.dart';

class CadrHotel extends StatelessWidget {
  final Data_Class_Hotel data_Hotel;

  const CadrHotel({super.key, required this.data_Hotel});

  @override
  Widget build(BuildContext context) {
    List imge = jsonDecode(data_Hotel.imgHotel.toString());
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Get.to(() => const DetailsHotel(),
            arguments: {
              "id": data_Hotel.idHotel.toString(),
              "description": data_Hotel.descriptionHotel,
              "rating": data_Hotel.rating,
              "img": data_Hotel.imgHotel.toString(),
              "price": data_Hotel.price.toString(),
              "longitude": data_Hotel.longitude,
              "latitude": data_Hotel.latitude,
              "situations": data_Hotel.situations,
            },
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500));
      },
      child: Container(
        width: 290,
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black),
        child: Stack(children: [
          AnimatedOpacity(
            opacity: 0.6,
            duration: const Duration(milliseconds: 500),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "$root/ecommerce/image/${imge[0].toString()}",
                  width: double.infinity,
                  height: 500,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
            left: 14,
            top: 14,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 226, 226, 226).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(6)),
              child: const Text(
                "Hotels",
                style: TextStyle(
                    fontFamily: "cairo",
                    fontSize: 13,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
            right: isArabic(240, 10),
            top: 230,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 2, right: 5, top: 2, bottom: 2),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    size: 20,
                    color: Color.fromARGB(255, 255, 165, 10),
                  ),
                  Text(
                    data_Hotel.rating.toString(),
                    style: const TextStyle(
                        fontFamily: "cairo",
                        fontSize: 13,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 250,
              right: 20,
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: isblack(const Color.fromARGB(255, 60, 60, 60),
                        const Color.fromARGB(255, 245, 245, 245)),
                  ),
                  child: GetBuilder<FavoriteController>(builder: (cont) {
                    return TextButton(
                        onPressed: () {
                          if (cont.favorite[data_Hotel.idHotel] == 1) {
                            cont.setFavodrite(data_Hotel.idHotel, 0);
                            cont.del_Fav(data_Hotel.idHotel.toString());
                          } else {
                            cont.setFavodrite(data_Hotel.idHotel, 1);
                            cont.add_Fav(data_Hotel.idHotel.toString());
                          }
                        },
                        child: Icon(
                          cont.favorite[data_Hotel.idHotel] == 1
                              ? Icons.bookmark
                              : Icons.bookmark_border_rounded,
                          color: isblack(
                              const Color.fromARGB(255, 255, 255, 255),
                              const Color.fromARGB(255, 97, 97, 97)),
                        ));
                  }))),
          Positioned(
            left: isArabic(245, 18),
            bottom: 20,
            child: Text(
              data_Hotel.nomHotel.toString(),
              style: const TextStyle(
                  fontFamily: "cairo",
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: isArabic(110, 10),
            bottom: 55,
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 20,
                ),
                wid(2),
                const Text(
                  "Safi-Abda",
                  style: TextStyle(fontFamily: "Cairo", color: Colors.white),
                ),
                wid(w / 4),
              ],
            ),
          ),
          Positioned(
            right: isArabic(200, 15),
            bottom: 10,
            child: Row(
              children: [
                Text(
                  "${data_Hotel.price.toString()}\$",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      fontFamily: 'cairo'),
                ),
                const Text(
                  " / Night",
                  style: TextStyle(
                      fontSize: 12, fontFamily: "cairo", color: Colors.white),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
