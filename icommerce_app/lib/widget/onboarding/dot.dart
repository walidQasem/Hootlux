import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/constant/onboarfingList.dart';

import '../../controller/auth/onboardingController.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControlller>(
        builder: ((controller) => Column(
              children: [
                Container(
                  padding:EdgeInsets.symmetric(horizontal:40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      ...List.generate(listeOnboarding.length, ((index) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: AnimatedContainer(
                            height: 8,
                            width: controller.pageOnc == index ? 20 : 8,
                            decoration: BoxDecoration(
                                color:controller.pageOnc == index ? colorbutton : Color.fromARGB(255, 129, 182, 255),
                                borderRadius: BorderRadius.circular(50)),
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      }))
                    ],
                  ),
                ),
              ],
            )));
  }
}














    //  Column(
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     ...List.generate(4, ((index) {
    //                       return AnimatedContainer(
    //                         margin: const EdgeInsets.all(3),
    //                         height: 8,
    //                         width: 8,
    //                         decoration: BoxDecoration(
    //                             color: Colors.red,
    //                             borderRadius: BorderRadius.circular(50)),
    //                         duration: const Duration(seconds: 1),
    //                       );
    //                     }))
    //                   ],
    //                 ),
    //               ],
    //             );