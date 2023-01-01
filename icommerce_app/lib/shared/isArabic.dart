import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:widget/main.dart';

isArabic(double x, double xx) {
  return shardp!.getString('LocalS') == "ar"
      ? x
      : xx;
}
