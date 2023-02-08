import 'package:flutter/material.dart';
import 'package:widget/shared/hieght.dart';

import '../../shared/text.dart';

class CardDashBoardInformation extends StatelessWidget {
  const CardDashBoardInformation(
      {super.key, required this.keyy, required this.values});
  final String keyy;
  final String values;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        text(keyy, Colors.grey, 13, FontWeight.bold),
        wid(20),
        text(
            values, const Color.fromARGB(255, 27, 27, 27), 13, FontWeight.bold),
      ],
    );
  }
}
