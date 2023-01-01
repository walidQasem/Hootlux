import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:widget/locale/localeController.dart';

import '../../shared/flageColumn.dart';
import '../../view/onboarding.dart';

class FlageGrid extends GetView<MylocalController> {
  const FlageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    PageController itme = PageController(initialPage: 1, viewportFraction: 0.6);
    Get.put(MylocalController());
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 220),
        children: [
          InkWell(
            child: flageColumn("moroccoS.png", "العربية"),
            onTap: () {
              controller.changeLangue("ar");
              Get.to(() => const Onboarding(),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 700));
            },
          ),
          InkWell(
            child: flageColumn("unitedS.png", "English"),
            onTap: () {
              controller.changeLangue("en");
              Get.to(() => const Onboarding(),
                  transition: Transition.downToUp,
                  duration: const Duration(milliseconds: 700));
            },
          ),
          InkWell(
            child: flageColumn("germanyS.png", "germany"),
            onTap: () {},
          ),
          InkWell(
            child: flageColumn("franceS.png", "France"),
            onTap: () {},
          ),
        ],
      );
  }
}