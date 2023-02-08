import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/text.dart';
import 'package:widget/view/home/profile/Favorite.dart';
import 'package:widget/view/home/profile/profil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../controller/home/HomeController.dart';
import 'booking/addHotel.dart';
import 'booking/booking.dart';
import 'homepage/home.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pc = PageController(viewportFraction: 0.9, initialPage: 1);
    HomeController cont = Get.put(HomeController());
    PageController pce = PageController(viewportFraction: 0.2, initialPage: 3);

    List listeHomePgae = [
      const Home(),
      const Booking(),
      const Favorite(),
      const Profil(),
    ];

    return GetBuilder<HomeController>(builder: (context) {
      return Scaffold(
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(() => const AddHotel(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 400));
          },
          child: Container(
              width: 100,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                  color: colorbutton, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  text("Create", Colors.white, 13, FontWeight.bold)
                ],
              )),
        ),
        resizeToAvoidBottomInset: false,
        appBar:
            listeHomePgae.elementAt(context.indexPage).toString() != "Favorite"
                ? appbarfunction(
                    listeHomePgae.elementAt(context.indexPage).toString())
                : null,
        body: GetBuilder<HomeController>(builder: (controller) {
          return Container(
              child: listeHomePgae.elementAt(controller.indexPage));
        }),
        bottomNavigationBar: GetBuilder<HomeController>(builder: (controller) {
          return Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            child: GNav(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                tabBackgroundColor: colorbutton,
                activeColor: const Color.fromARGB(255, 255, 255, 255),
                gap: 8,
                onTabChange: (val) {
                  controller.echange(val);
                },
                textStyle: const TextStyle(
                    fontFamily: "cairo",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                tabs: const [
                  GButton(icon: Icons.home_outlined, text: "Home"),
                  GButton(icon: Icons.hotel, text: "Booking"),
                  GButton(icon: Icons.favorite_border, text: "Favorite"),
                  GButton(icon: Icons.person_outline, text: "Profile"),
                ]),
          );
        }),
      );
    });
  }
}
