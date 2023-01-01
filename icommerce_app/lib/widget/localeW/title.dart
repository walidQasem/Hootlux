import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Bartitle extends StatelessWidget {
  const Bartitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          "1".tr,
          style: const TextStyle(
                   fontFamily:"cairo",
            fontWeight: FontWeight.bold, fontSize: 25),
        )),

      const Center(
          child: Text(
        " yo want to learn , and master it",
        style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
            fontFamily:"cairo",
            color: Color.fromARGB(255, 84, 84, 84)),
      ))
      ],
    );
  }
}
