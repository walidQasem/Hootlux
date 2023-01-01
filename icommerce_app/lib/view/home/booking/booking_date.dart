import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/bookignController.dart';
import 'package:widget/shared/appBar.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/view/home/booking/payment.dart';

import '../../../shared/button.dart';
import '../../../shared/text.dart';

class Bookingdate extends StatelessWidget {
  const Bookingdate({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> enfant = [0, 1, 2, 3, 4, 5, 6];
    List<int> dulte = [1, 2, 3, 4, 5, 6];
    List month = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    BookingController bk = Get.put(BookingController());
    return Scaffold(
      appBar: appbarfunction("Booking Date"),
      body: GetBuilder<BookingController>(builder: (cont) {
        return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(children: [
              SfDateRangePicker(
                selectionTextStyle: const TextStyle(
                    fontFamily: "cairo", fontWeight: FontWeight.bold),
                rangeTextStyle: TextStyle(
                    fontFamily: "cario",
                    fontWeight: FontWeight.bold,
                    color: isblack(const Color.fromARGB(255, 224, 224, 224),
                        const Color.fromARGB(255, 79, 79, 79))),
                onSelectionChanged: (x) {
                  bk.onchangedate(x.value);
                  bk.oncready();
                  cont.calculerSome();
                },
                onViewChanged: (x) {},
                monthCellStyle: DateRangePickerMonthCellStyle(
                    textStyle: TextStyle(
                        fontFamily: "cairo",
                        color: isblack(const Color.fromARGB(255, 224, 224, 224),
                            const Color.fromARGB(255, 79, 79, 79)))),
                selectionMode: DateRangePickerSelectionMode.range,
                headerStyle: DateRangePickerHeaderStyle(
                    textStyle: const TextStyle(fontFamily: "cairo"),
                    textAlign: TextAlign.center,
                    backgroundColor: isblack(
                        const Color.fromARGB(255, 67, 67, 67),
                        const Color.fromARGB(255, 203, 203, 203))),
                enablePastDates: true,
              ),
              SizedBox(
                height: 190,
                child: Stack(
                  children: [
                    const Text(""),
                    Positioned(
                        right: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                                "from day",
                                isblack(
                                    const Color.fromARGB(255, 224, 224, 224),
                                    const Color.fromARGB(255, 79, 79, 79)),
                                16,
                                FontWeight.bold),
                            text(
                                "${cont.stratDate!.month.toString()}/${cont.stratDate!.day.toString()}",
                                isblack(
                                    const Color.fromARGB(255, 224, 224, 224),
                                    const Color.fromARGB(255, 79, 79, 79)),
                                15,
                                FontWeight.w100)
                          ],
                        )),
                    Positioned(
                        left: 20,
                        child: Column(
                          children: [
                            text(
                                "to day",
                                isblack(
                                    const Color.fromARGB(255, 224, 224, 224),
                                    const Color.fromARGB(255, 79, 79, 79)),
                                16,
                                FontWeight.bold),
                            text(
                                "${cont.endDate!.month.toString()}/${cont.endDate!.day.toString()}",
                                isblack(
                                    const Color.fromARGB(255, 224, 224, 224),
                                    const Color.fromARGB(255, 79, 79, 79)),
                                15,
                                FontWeight.w100)
                          ],
                        )),
                    Positioned(
                        left: 20,
                        top: 80,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                                "Number a children",
                                isblack(
                                    const Color.fromARGB(255, 224, 224, 224),
                                    const Color.fromARGB(255, 79, 79, 79)),
                                15,
                                FontWeight.bold),
                            SizedBox(
                              width: 100,
                              child: DropdownButton<int>(
                                underline: Container(),
                                menuMaxHeight: 120,
                                borderRadius: BorderRadius.circular(7),
                                icon: Container(
                                    child: const Icon(
                                        Icons.arrow_drop_down_rounded)),
                                value: cont.indexEfant,
                                style: TextStyle(
                                    color: isblack(
                                        const Color.fromARGB(
                                            255, 224, 224, 224),
                                        const Color.fromARGB(255, 79, 79, 79)),
                                    fontFamily: "cairo"),
                                items: enfant
                                    .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e.toString(),
                                          style: TextStyle(
                                              color: isblack(
                                                  const Color.fromARGB(
                                                      255, 224, 224, 224),
                                                  const Color.fromARGB(
                                                      255, 79, 79, 79))),
                                        )))
                                    .toList(),
                                onChanged: (x) {
                                  cont.changeDropDownEnfant(x!);
                                  cont.calculerSome();
                                },
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                        right: 20,
                        top: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                                "Number a dulte",
                                isblack(
                                    const Color.fromARGB(255, 224, 224, 224),
                                    const Color.fromARGB(255, 79, 79, 79)),
                                15,
                                FontWeight.bold),
                            SizedBox(
                              width: 100,
                              child: DropdownButton<int>(
                                underline: Container(),
                                borderRadius: BorderRadius.circular(7),
                                menuMaxHeight: 120,
                                icon: const Icon(Icons.arrow_drop_down_rounded),
                                value: cont.indexdult,
                                style: TextStyle(
                                    color: isblack(
                                        const Color.fromARGB(
                                            255, 224, 224, 224),
                                        const Color.fromARGB(255, 79, 79, 79)),
                                    fontFamily: "cairo"),
                                items: dulte
                                    .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(
                                          e.toString(),
                                          style: TextStyle(
                                              color: isblack(
                                                  const Color.fromARGB(
                                                      255, 224, 224, 224),
                                                  const Color.fromARGB(
                                                      255, 79, 79, 79))),
                                        )))
                                    .toList(),
                                onChanged: (x) {
                                  cont.changeDropDowndelt(x!);
                                  cont.calculerSome();
                                },
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        text(
                            "${cont.some.toString()} DH",
                            isblack(const Color.fromARGB(255, 224, 224, 224),
                                const Color.fromARGB(255, 79, 79, 79)),
                            16,
                            FontWeight.bold),
                        Positioned(
                            right: 10,
                            child: text(
                                "The amount required",
                                isblack(
                                    const Color.fromARGB(255, 187, 187, 187),
                                    const Color.fromARGB(255, 79, 79, 79)),
                                13,
                                FontWeight.bold))
                      ],
                    ),
                  )),
                  hieght(20),
              ButtonFun("Follow up", colorbutton, 200, 50, () {
                Get.to(() => const Payment());
              }, null, const Icon(Icons.arrow_circle_right_outlined)),
            ]));
      }),
    );
  }
}
