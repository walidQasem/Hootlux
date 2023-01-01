import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/rooteNamed.dart';
import 'package:widget/main.dart';

class Mymeddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {

    if (shardp!.getString("emailKey") != null) {
        return RouteSettings(name: Approot.home);
      }
    if (shardp!.getString("onboarding") == "4") {
      return RouteSettings(name: Approot.signin);
    } 


  }
}
