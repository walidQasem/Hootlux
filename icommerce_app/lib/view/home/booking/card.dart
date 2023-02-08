import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/button.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/home/booking/Payment%20confirmation.dart';

import '../../../shared/textFild.dart';

class CardPayment extends StatelessWidget {
  const CardPayment({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfunction("Another Card"),
      body: ListView(
        children: [
          SizedBox(
              height: 260,
              child: Image.asset(
                "images/card.png",
                fit: BoxFit.cover,
                height: 300,
              )),
          hieght(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Edittext(
                onTap: () {},
                validator: (val) {
                  return null;
                },
                labele: "",
                obescure: false,
                enabel: true,
                icon: null,
                hint: 'Card Number',
                prifixicon: null),
          ),
          hieght(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Edittext(
                onTap: () {},
                validator: (val) {
                  return null;
                },
                labele: "",
                obescure: false,
                enabel: true,
                icon: null,
                hint: 'Exprirs',
                prifixicon: null),
          ),
          hieght(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Edittext(
                onTap: () {},
                validator: (val) {
                  return null;
                },
                labele: "",
                obescure: false,
                enabel: true,
                icon: null,
                hint: 'Card Number',
                prifixicon: null),
          ),
          hieght(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Edittext(
                onTap: () {},
                validator: (val) {
                  return null;
                },
                labele: "",
                obescure: false,
                enabel: true,
                icon: null,
                hint: 'Card Number',
                prifixicon: null),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonFun("Next", colorbutton, double.infinity, 50, () {
              Get.to(() => const PaymentConfomation());
            }, null, const Icon(Icons.next_plan_outlined),null),
          ),
        ],
      ),
    );
  }
}
