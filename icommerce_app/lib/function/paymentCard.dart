import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/paymentController.dart';
import 'package:widget/shared/hieght.dart';

import '../shared/isBlack.dart';
import '../shared/text.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key, required this.value, required this.icon});
  final String value;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (con) {
      return Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.1,
                    color: isblack(const Color.fromARGB(255, 255, 255, 255),
                        const Color.fromARGB(255, 0, 0, 0))))),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            const Text(""),
            Positioned(left: 0, top: 7, child: icon),
            wid(20),
            Positioned(
                left: 60,
                top: 10,
                child: text(
                    value,
                    isblack(const Color.fromARGB(255, 255, 255, 255),
                        const Color.fromARGB(255, 0, 0, 0)),
                    18,
                    FontWeight.bold)),
            Positioned(
                right: 10,
                top: 10,
                child: Radio(
                  activeColor: colorbutton,
                  value: value,
                  groupValue: con.ntroGroup,
                  onChanged: (val) {
                    con.changeRadioGroup(val!);
                  },
                ))
          ],
        ),
      );
    });
  }
}
