import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/paymentController.dart';
import 'package:widget/function/paymentCard.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/shared/text.dart';

import '../../../shared/button.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentController p = Get.put(PaymentController());
    return Scaffold(
      appBar: appbarfunction("Payment"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<PaymentController>(builder: (con) {
          return ListView(children: [
            hieght(20),
            text(
                "Payment method",
                isblack(const Color.fromARGB(255, 255, 255, 255),
                    const Color.fromARGB(255, 0, 0, 0)),
                20,
                FontWeight.bold),
            hieght(20),
            const PaymentCard(
              value: 'Paypal',
              icon: Icon(Icons.paypal, size: 41),
            ),
            const PaymentCard(
              value: 'Google play',
              icon: Icon(Icons.play_arrow_rounded, size: 41),
            ),
            const PaymentCard(
              value: 'Apple play',
              icon: Icon(
                Icons.apple_outlined,
                size: 41,
              ),
            ),
            const PaymentCard(
              value: 'Another Card',
              icon: Icon(
                Icons.credit_card_rounded,
                size: 41,
              ),
            ),
             hieght(40),
            ButtonFun("Next", colorbutton, 200, 50, () {
              con.toPageCard();
            }, null,
                const Icon(Icons.arrow_circle_right_outlined)),
            // Text("${con.ntroGroup}")
          ]);
        }),
      ),
    );
  }
}
