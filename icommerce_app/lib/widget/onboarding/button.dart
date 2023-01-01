import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../controller/auth/onboardingController.dart';

class OnboardingButtom extends StatelessWidget {
  const OnboardingButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControlller>(builder: ((controller) {
      return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 55,
          child: MaterialButton(
      
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              controller.next();
            },
            color: colorbutton,
            textColor: Colors.white,
            
            child: const Text(
              "Continue",
              style: TextStyle(fontWeight: FontWeight.bold      ,fontFamily:"cairo",),
            ),
          ));
    }));
  }
}
