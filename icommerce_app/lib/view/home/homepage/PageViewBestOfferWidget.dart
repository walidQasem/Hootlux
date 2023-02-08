import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/class/staturequest.dart';

import 'package:widget/controller/home/HomeController.dart';
import 'package:widget/controller/home/hotel/FavoriteController.dart';

import 'package:widget/model/Hotel/Hotel_Model.dart';

import 'package:widget/widget/home/homePage/card_Hotel.dart';

import '../../../Shimmer/Home_shimmer.dart';

class ProposedToYou extends StatelessWidget {
  const ProposedToYou({super.key});

  @override
  Widget build(BuildContext context) {
    final m = MediaQuery.of(context).size.width;
    FavoriteController favController = Get.put(FavoriteController());
    PageController page = PageController(
      initialPage: 1,
      viewportFraction: m > 800 ? 0.3 : 0.8,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: SizedBox(
        width: 500,
        height: 320,
        child: GetBuilder<HomeController>(builder: (context) {
          if (context.statusRequest == StatusRequest.loading) {
            return ListView(
              children: const [Home_shimmer()],
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: context.hotelVille.length,
                itemBuilder: (contex, i) {
                  favController.favorite[context.hotelVille[i]['id_Hotel']] =
                      context.hotelVille[i]['favorite'];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CadrHotel(
                        data_Hotel:
                            Data_Class_Hotel.fromJson(context.hotelVille[i])),
                  );
                });
          }
        }),
      ),
    );
  }
}
