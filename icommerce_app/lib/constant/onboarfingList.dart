import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';

import '../model/onboarding.dart';


  
List<OnboardingModel> listeOnboarding = [

  OnboardingModel(
      title: "Get your hotel now",
      img: "https://images.unsplash.com/photo-1549294413-26f195200c16?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      body:"find your of your choice and get it rith\n now"),
  OnboardingModel(
      title: "Manage bookings",
      img: "https://images.unsplash.com/photo-1537572263231-4314a30d444f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
           body:"Booking and cancellation anyy time any where you want to"),
  OnboardingModel(
      title: "Stay in touch",
      img: "https://images.unsplash.com/photo-1613618959971-98ea2f0b6101?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
          body:"reach out to any one at any time we are there for you "),

];
  @override
  Widget build(BuildContext context) {
    
    return Container();
  }

