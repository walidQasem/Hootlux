import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/bookignController.dart';
import 'package:widget/shared/appBar.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/widget/home/booking/inkwelGeast.dart';

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
                rangeSelectionColor: isblack(
                    const Color.fromARGB(255, 58, 89, 137),
                    const Color.fromARGB(255, 197, 217, 255)),
                minDate: DateTime.now(),
                endRangeSelectionColor: const Color.fromARGB(255, 87, 152, 255),
                enableMultiView: false,
                allowViewNavigation: true,
                initialDisplayDate: DateTime.now(),
                initialSelectedDate: DateTime.now(),
                initialSelectedRange: PickerDateRange(
                    DateTime.now(),
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day + 1)),
                selectionTextStyle: const TextStyle(
                    fontFamily: "cairo", fontWeight: FontWeight.bold),
                rangeTextStyle: TextStyle(
                    fontFamily: "cario",
                    fontWeight: FontWeight.bold,
                    color: isblack(const Color.fromARGB(255, 255, 255, 255),
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: text("Guest", const Color.fromARGB(255, 68, 68, 68), 20,
              //       FontWeight.bold),
              // ),
              Container(
                decoration: BoxDecoration(
                    color: isblack(
                        const Color.fromARGB(255, 43, 43, 43), Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                width: 100,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: text(
                            "Adults",
                            isblack(const Color.fromARGB(255, 228, 228, 228),
                                const Color.fromARGB(255, 50, 50, 50)),
                            16,
                            FontWeight.bold),
                        subtitle: text(
                            "Over 17 years",
                            const Color.fromARGB(255, 168, 168, 168),
                            12,
                            FontWeight.bold),
                      ),
                    ),
                    GetBuilder<BookingController>(builder: (contex) {
                      return InkwemGeast(
                        onTap1: () {
                          contex.decrimentAdult();
                        },
                        onTap2: () {
                          contex.incrimentAdult();
                        },
                        text: contex.indexdult.toString(),
                      );
                    }),
                  ],
                ),
              ),
              hieght(10),

              Container(
                decoration: BoxDecoration(
                    color: isblack(
                        const Color.fromARGB(255, 43, 43, 43), Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                width: 100,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: text(
                            "Child",
                            isblack(const Color.fromARGB(255, 228, 228, 228),
                                const Color.fromARGB(255, 50, 50, 50)),
                            16,
                            FontWeight.bold),
                        subtitle: text(
                            "Over 17 years",
                            const Color.fromARGB(255, 168, 168, 168),
                            12,
                            FontWeight.bold),
                      ),
                    ),
                    GetBuilder<BookingController>(builder: (contex) {
                      return InkwemGeast(
                        onTap1: () {
                          contex.decrimenttEfant();
                        },
                        onTap2: () {
                          contex.incrimentEfant();
                        },
                        text: contex.indexEfant.toString(),
                      );
                    }),
                  ],
                ),
              ),
              hieght(10),
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
              ButtonFun("Follow up", colorbutton, 200, 60, () {
                bk.isvalidechn();
              }, null, const Icon(Icons.arrow_circle_right_outlined), null),
            ]));
      }),
    );
  }
}
