import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/dashboard/dashboardController.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/text.dart';
import 'package:widget/view/home/booking/addHotel.dart';

class HomeDash extends StatelessWidget {
  const HomeDash({super.key});

  @override
  Widget build(BuildContext context) {
    DashBoardController gg = Get.put(DashBoardController());
    final m = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
     
      ),
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SmartRefresher(
        onRefresh: () => gg.get_data(),
        controller: gg.r,
        header: WaterDropHeader(
          waterDropColor: colorbutton,
          completeDuration: Duration.zero,
        ),
        child: GetBuilder<DashBoardController>(builder: (cont) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: NavigationRail(
                  selectedIconTheme:
                      IconThemeData(color: colorbutton, size: 30),
                  useIndicator: true,
                  onDestinationSelected: (i) {
                    cont.chnage(i);
                  },
                  backgroundColor: const Color.fromARGB(255, 215, 223, 255),
                  indicatorColor: Colors.grey[50],
                  destinations: const [
                    NavigationRailDestination(
                        icon: Icon(Icons.space_dashboard_rounded),
                        label: Text("home")),
                    NavigationRailDestination(
                        icon: Icon(Icons.supervised_user_circle_rounded),
                        label: Text("azdaz")),
                    NavigationRailDestination(
                        icon: Icon(Icons.hotel_rounded), label: Text("azdaz")),
                    NavigationRailDestination(
                        icon: Icon(Icons.home), label: Text("azdaz")),
                    NavigationRailDestination(
                        icon: Icon(Icons.settings), label: Text("azdaz")),
                  ],
                  selectedIndex: cont.index,
                ),
              ),
              wid(10),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 5000,
                      child: ListView(
                        controller: ScrollController(),
                        scrollDirection: Axis.horizontal,
                        children: [cont.listwd.elementAt(cont.index)],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
