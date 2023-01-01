import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/class/staturequest.dart';

import 'package:widget/controller/home/HomeController.dart';
import 'package:widget/controller/home/hotel/FavoriteController.dart';

import 'package:widget/model/Hotel/Hotel_Model.dart';

import 'package:widget/view/home/homepage/details.dart';

import 'package:widget/widget/home/homePage/card_Hotel.dart';

import '../../../Shimmer/Home_shimmer.dart';

class HighestRated extends StatelessWidget {
  const HighestRated({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favController = Get.put(FavoriteController());
    PageController page = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );
    return SizedBox(
      width: 100,
      height: 320,
      child: GetBuilder<HomeController>(builder: (context) {
        if (context.statusRequest == StatusRequest.loading) {
          return ListView(
            children: const [Home_shimmer(), Home_shimmer(), Home_shimmer()],
          );
        } else {
          return PageView.builder(
              controller: page,
              itemCount: context.hotelVille.length,
              itemBuilder: (contex, i) {
                favController.favorite[context.hotelVille[i]['id_Hotel']] =
                    context.hotelVille[i]['favorite'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CadrHotel(
                      data_Hotel: Data_Class_Hotel.fromJson(context.hightestRated[i])),
                );
              });
        }
      }),
    );
  }
}
