import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/HomeController.dart';
import 'package:widget/controller/home/hotel/FavoriteController.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/view/home/homepage/PageViewBestOfferWidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:widget/view/home/homepage/categoryWidget.dart';
import 'package:widget/view/home/homepage/highestRated.dart';
import 'package:widget/view/home/homepage/searchInput.dart';

import '../../../class/staturequest.dart';
import '../../../shared/text.dart';
import '../../../widget/home/homePage/headerPageHome.dart';

import 'RecommanedWidgetListView.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    HomeController cont = Get.put(HomeController());

    FavoriteController favController = Get.put(FavoriteController());
    List<Widget> categoryHotelFilter = [
      const ProposedToYou(),
      const HighestRated(),
      const Text("wa")
    ];
    return SmartRefresher(
      onRefresh: () => cont.getdata(),
      controller: cont.r,
      header: WaterDropHeader(
        waterDropColor: colorbutton,
        completeDuration: Duration.zero,
      ),
      child: GetBuilder<HomeController>(builder: (context) {
        if (context.statusRequest == StatusRequest.offlinFailure ||
            context.statusRequest == null) {
          return Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wifi_off_rounded,
                size: 100,
              ),
              text("No internet", isblack(Colors.white, Colors.black), 18,
                  FontWeight.bold),
              text("Please check your internet",
                  isblack(Colors.white, Colors.black), 15, FontWeight.w200)
            ],
          ));
        } else {
          return ListView(children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: HeaderPageHome(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Let's find the best Hotel",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    fontFamily: "cairo"),
              ),
            ),
            hieght(15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SearchInput(),
            ),
            hieght(5),
            const CatigoriesWidget(),
            hieght(5),
            GetBuilder<HomeController>(builder: (con) {
              return categoryHotelFilter.elementAt(con.indexCategory);
            }),
            hieght(5),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: text(
                    "rest of the hotels",
                    isblack(const Color.fromARGB(255, 255, 255, 255),
                        const Color.fromARGB(255, 30, 30, 30)),
                    17,
                    FontWeight.bold)),
            const RecommandeWidget()
          ]);
        }
      }),
    );
  }
}
