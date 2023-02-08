import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:widget/Shimmer/Favrite_shimmer.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/model/Hotel/Hotel_Model.dart';
import 'package:widget/shared/appBar.dart';

import '../../../controller/home/hotel/GetFavController.dart';
import '../../../widget/home/profile/cardFavorite.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    AfichageFavoriteControllere c = Get.put(AfichageFavoriteControllere());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: appbarfunction("Favorite"),
        body: ListView(
          children: [
            GetBuilder<AfichageFavoriteControllere>(builder: (con) {
              if (con.statusRequist == StatusRequest.loading) {
                return SizedBox(
                  width: double.infinity,
                  height: h / 1.2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, i) {
                        return const Favorite_shimmer();
                      },
                    ),
                  ),
                );
              } else {
                if (con.statusRequist == StatusRequest.success) {
                  if (con.fave.isEmpty) {
                    return SizedBox(
                      width: w,
                      height: h / 1.3,
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset("assets/favorite.json", width: 300),
                          const Text(
                            "Empty",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "cairo"),
                          ),
                          const Text(
                            "you dont have any favorite",
                            style: TextStyle(fontFamily: "cairo"),
                          )
                        ],
                      )),
                    );
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: con.fave.length,
                        itemBuilder: (contex, i) {
                          return CardFavorite(
                              dataHotel:
                                  Data_Class_Hotel.fromJson(con.fave[i]));
                        },
                      ),
                    );
                  }
                }
              }
              return const Text("w");
            }),
          ],
        ));
  }
}
