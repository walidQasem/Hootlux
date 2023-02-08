import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/shared/text.dart';

class TbaleWidget extends StatelessWidget {
  const TbaleWidget({super.key, required this.title, required this.values});
  final String title;
    final String values;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Container(
        child: Stack(children: [
          text(
              title,
              isblack(const Color.fromARGB(255, 215, 215, 215),
                  const Color.fromARGB(255, 116, 116, 116)),
              14,
              FontWeight.bold),
          Positioned(
              right: 10,
              child: text(
                  values,
                  isblack(const Color.fromARGB(255, 255, 255, 255),
                      const Color.fromARGB(255, 0, 0, 0)),
                  15,
                  FontWeight.bold))
        ]),
      ),
    );
  }
}
