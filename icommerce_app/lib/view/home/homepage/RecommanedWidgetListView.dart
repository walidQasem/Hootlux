import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/class/staturequest.dart';

import 'package:widget/controller/home/HomeController.dart';
import 'package:widget/controller/home/hotel/FavoriteController.dart';

import 'package:widget/model/Hotel/Hotel_Model.dart';

import 'package:widget/view/home/homepage/details.dart';

import 'package:widget/widget/home/homePage/card_Hotel_Search.dart';

import '../../../Shimmer/Home_shimmer.dart';

class RecommandeWidget extends StatelessWidget {
  const RecommandeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favController = Get.put(FavoriteController());
    PageController page = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );
    return SizedBox(
      width: 100,
      child: GetBuilder<HomeController>(builder: (context) {
        if (context.statusRequest == StatusRequest.loading) {
          return Column(
            children: const [Home_shimmer()],
          );
        } else {
          return Column(
            children: [
              ...List.generate(context.data.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => const DetailsHotel(),
                          arguments: {
                            "img": context.data[index]['img_Hotel'].toString()
                          },
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 500));
                    },
                    child: CardSearchHotel(
                        dataHotel:
                            Data_Class_Hotel.fromJson(context.data[index])),
                  ),
                );
              })
            ],
          );

        }
      }),
    );
  }
}
