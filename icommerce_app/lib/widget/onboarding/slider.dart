import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/auth/singin.dart';
import '../../constant/onboarfingList.dart';
import '../../controller/auth/onboardingController.dart';

class Slidere extends GetView<OnboardingControlller> {
  const Slidere({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    Get.put(OnboardingControlller());
    return PageView.builder(

        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onpage(val);

        },
        itemCount: listeOnboarding.length,
        itemBuilder: (context, i) {
          return Column(children: [
           
            Container(
             
              width:800,
              height:h/1.6,
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft:Radius.elliptical(400,110)),
                child: Image.network(
                    
                  listeOnboarding[i].img,
                   
                  fit: BoxFit.fill,
                ),
              ),
            ),
            hieght(10),
            Container(
       
              child: AutoSizeText(
                
                maxLines: 1,
                listeOnboarding[i].title,
               
                textAlign: TextAlign.center,
                
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize:25,fontWeight:FontWeight.bold ,fontFamily:"cairo",),
              ),
            ),
              Container(
         padding: EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                
                maxLines: 2,
                listeOnboarding[i].body,
               
                textAlign: TextAlign.center,
                
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize:20 ,fontFamily:"cairo",),
              ),
            ),
          ]);
        });
  }
}
