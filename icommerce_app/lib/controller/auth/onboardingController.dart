import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:widget/constant/onboarfingList.dart';
import 'package:widget/main.dart';
import '../../constant/rooteNamed.dart';
class OnboardingControlller extends GetxController {
  int pageOnc = 0;
  PageController? pageController;

  
  next() {
    pageOnc++;
    if (pageOnc > listeOnboarding.length - 1) {
      shardp!.setString("onboarding", "4");
      Get.offAllNamed(Approot.signin);
    } else {
      pageController!.animateToPage(pageOnc,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic);
    }
  }

  onpage(int index) {
    pageOnc = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: pageOnc);
    super.onInit();
  }
}
