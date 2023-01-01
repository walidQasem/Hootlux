import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

checkInterNet() async {
  var res = await Connectivity().checkConnectivity();
  if (res == ConnectivityResult.none) {
    return false;
  }
}
