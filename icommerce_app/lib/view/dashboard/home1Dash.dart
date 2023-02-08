import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/dashboard/dashboardController.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/hieght.dart';

import '../../widget/dashboard/navigatorBar.dart';

class Home1Dash extends StatelessWidget {
  const Home1Dash({super.key});

  @override
  Widget build(BuildContext context) {
    DashBoardController dd = Get.put(DashBoardController());
    return Scaffold(
      appBar: appbarfunction("Home Dashboard"),
      body: GetBuilder<DashBoardController>(builder: (cont) {
        return Row(children: [
          const NavigatorBar(),
          wid(20),
          Expanded(
              child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: ListView(
              children: [cont.listwd.elementAt(cont.index)],
            ),
          ))
        ]);
      }),
    );
  }
}
