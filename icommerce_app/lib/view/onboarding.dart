import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/auth/onboardingController.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/widget/onboarding/slider.dart';
import '../widget/onboarding/button.dart';
import '../widget/onboarding/dot.dart';

class Onboarding extends StatelessWidget  {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: const [
            Expanded(child: Slidere()),
            Dot(),
   
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
              child: OnboardingButtom(),
            )
          ],
        ));
  }
}
