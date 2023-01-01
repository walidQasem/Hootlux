import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/home/HomeController.dart';
import 'package:widget/controller/home/hotel/FavoriteController.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/home/homepage/PageViewBestOfferWidget.dart';
import 'package:widget/view/home/homepage/bestOfferText.dart';
import 'package:widget/view/home/homepage/categoryWidget.dart';
import 'package:widget/view/home/homepage/highestRated.dart';
import 'package:widget/view/home/homepage/searchInput.dart';

import '../../../controller/home/search/searchController.dart';
import '../../../widget/home/homePage/headerPageHome.dart';

import 'RecommanedWidgetListView.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    HomeController cont = Get.put(HomeController());
    // Searche searchC = Get.put(Searche());
    FavoriteController favController = Get.put(FavoriteController());
    List<Widget> categoryHotelFilter = [
      const ProposedToYou(),
      const HighestRated(),
      const Text("wa")
    ];
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
              fontWeight: FontWeight.bold, fontSize: 27, fontFamily: "cairo"),
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
        child: BestOfferTextWidget(fun: () {}, text: "Categories         "),
      ),
      const RecommandeWidget()
    ]);
  }
}
