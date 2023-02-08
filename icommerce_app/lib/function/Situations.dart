import 'package:flutter/material.dart';

IconData? situations(String s) {
  if (s == "wifi") {
    return Icons.wifi;
  }
  if (s == "parking") {
    return Icons.local_parking_rounded;
  }
  if (s == "TV") {
    return Icons.tv_rounded;
  }
  if (s == "Washer") {
    return Icons.waves;
  }
  if (s == "Ac") {
    return Icons.ac_unit_rounded;
  }
  if (s == "Bar") {
    return Icons.filter_alt_outlined;
  }
  if (s == "food") {
    return Icons.food_bank_outlined;
  }
  if (s == "Fitness ") {
    return Icons.fitness_center_rounded;
  }
  if (s == "Sauna") {
    return Icons.bathroom_outlined;
  }
  if (s == "Internet") {
    return Icons.wifi_outlined;
  }
  return null;
}
