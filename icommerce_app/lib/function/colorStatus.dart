import 'package:flutter/material.dart';

import '../shared/text.dart';

Widget? colorStatus(String s) {
  if (s == "Currenty") {
    return text(s, Color.fromARGB(255, 227, 135, 55), 14, FontWeight.w700);
  }
  if (s == "Complited") {
    return text(s, Colors.green, 14, FontWeight.w700);
  }
  if (s == "Cancel") {
    return text(s, Color.fromARGB(255, 225, 105, 54), 14, FontWeight.w700);
  }

}
