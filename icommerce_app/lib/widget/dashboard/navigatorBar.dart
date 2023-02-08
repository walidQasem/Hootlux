import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/dashboard/dashboardController.dart';
import 'package:widget/main.dart';

class NavigatorBar extends StatelessWidget {
  const NavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (cont) {
      if (shardp!.getString("role") == "admin") {
        return Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 221, 225, 255),
                blurRadius: 22,
                offset: Offset(10, 30))
          ]),
          height: 480,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: NavigationRail(
                elevation: 5,
                selectedLabelTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 59, 59, 59),
                    fontWeight: FontWeight.bold),
                labelType: NavigationRailLabelType.all,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/avatar.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                selectedIconTheme: const IconThemeData(
                    color: Color.fromARGB(255, 255, 239, 239), size: 30),
                useIndicator: true,
                onDestinationSelected: (i) {
                  cont.chnage(i);
                },
                backgroundColor: const Color.fromARGB(255, 194, 206, 255),
                indicatorColor: const Color.fromARGB(255, 138, 161, 255),
                unselectedLabelTextStyle: const TextStyle(
                    fontFamily: "cario",
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
                unselectedIconTheme: const IconThemeData(size: 24, shadows: [
                  Shadow(
                      blurRadius: 5,
                      color: Color.fromARGB(255, 202, 202, 202),
                      offset: Offset(2, 12))
                ]),
                destinations: const [
                  NavigationRailDestination(
                      selectedIcon: Icon(
                        Icons.dashboard_outlined,
                      ),
                      icon: Icon(Icons.space_dashboard_rounded),
                      label: Text("Dashboard")),
                  NavigationRailDestination(
                      selectedIcon: Icon(Icons.date_range_rounded),
                      icon: Icon(Icons.date_range_outlined),
                      label: Text("Booking")),
                  NavigationRailDestination(
                      selectedIcon: Icon(Icons.hotel_outlined),
                      icon: Icon(Icons.hotel_rounded),
                      label: Text("Hotels")),
                  NavigationRailDestination(
                      selectedIcon: Icon(Icons.vpn_key_outlined),
                      icon: Icon(Icons.vpn_key_rounded),
                      label: Text("Concierge ")),
                  NavigationRailDestination(
                      icon: Icon(Icons.display_settings_rounded),
                      label: Text("settings")),
                ],
                selectedIndex: cont.index,
              ),
            ),
          ),
        );
      } else {
        return SizedBox(
          height: 370,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: NavigationRail(
                elevation: 5,
                selectedLabelTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 59, 59, 59),
                    fontWeight: FontWeight.bold),
                labelType: NavigationRailLabelType.all,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "images/avatar.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                selectedIconTheme: const IconThemeData(
                    color: Color.fromARGB(255, 255, 239, 239), size: 30),
                useIndicator: true,
                onDestinationSelected: (i) {
                  cont.chnage(i);
                },
                backgroundColor: const Color.fromARGB(255, 194, 206, 255),
                indicatorColor: const Color.fromARGB(255, 138, 161, 255),
                unselectedLabelTextStyle: const TextStyle(
                    fontFamily: "cario",
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
                unselectedIconTheme: const IconThemeData(size: 24, shadows: [
                  Shadow(
                      blurRadius: 5,
                      color: Color.fromARGB(255, 146, 146, 146),
                      offset: Offset(2, 12))
                ]),
                destinations: const [
                  NavigationRailDestination(
                      selectedIcon: Icon(Icons.date_range_rounded),
                      icon: Icon(Icons.date_range_outlined),
                      label: Text("azdaz")),
                  NavigationRailDestination(
                      icon: Icon(Icons.display_settings_rounded),
                      label: Text("azdaz")),
                ],
                selectedIndex: cont.index,
              ),
            ),
          ),
        );
      }
    });
  }
}
