import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/TicketController.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/hieght.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:widget/shared/isBlack.dart';
import '../../../shared/button.dart';
import '../../../widget/home/booking/TicketCard.dart';
import '../homeApp.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    TicketController tc = Get.put(TicketController());
    return Scaffold(
      appBar: appbarfunction("Ticket"),
      body: GetBuilder<TicketController>(builder: (cont) {
        if (cont.st == StatusRequest.loading) {
          return Center(
              child: LottieBuilder.asset(
            "assets/ticket.json",
            width: 130,
          ));
        } else {
          if (cont.st == StatusRequest.success) {
            return ListView(
              children: [
                Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 46, vertical: 50),
                      child: Center(
                        child: Stack(
                          children: [
                            Column(children: [
                              Container(
                                width: double.infinity,
                                height: 560,
                                color: colorbutton,
                                child: Column(
                                  children: [
                                    hieght(20),
                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(20),
                                          width: 600,
                                          height: 180,
                                          child: BarcodeWidget(
                                            data: 'reservation id:15426487232',
                                            barcode: Barcode.code128(),
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                        )
                                      ],
                                    ),
                                    hieght(15),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          TicketCard(
                                              keye1: "Name",
                                              value1: cont.name.toString(),
                                              keye2: "Number Phone",
                                              value2: cont.nbPhone.toString()),
                                          TicketCard(
                                              keye1: "From date",
                                              value1: cont.fromDate.toString(),
                                              keye2: "to date",
                                              value2: cont.toDate.toString()),
                                          TicketCard(
                                              keye1: "Children",
                                              value1: cont.nbChilren.toString(),
                                              keye2: "Hotel",
                                              value2:
                                                  cont.hotelname.toString()),
                                        ],
                                      ),
                                    ),
                                    hieght(30),
                                    const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: DottedLine(
                                          dashColor: Colors.white,
                                        )),
                                    hieght(20),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: ButtonFun(
                                          "Save Ticket",
                                          isblack(
                                              const Color.fromARGB(
                                                  255, 70, 70, 70),
                                              const Color.fromARGB(
                                                  255, 255, 255, 255)),
                                          double.infinity,
                                          50, () {
                                        Get.offAll(() => const HomeApp());
                                        // tc.chowId();
                                      }, null, const Icon(Icons.save),
                                          isblack(Colors.white, Colors.black)),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                            Positioned(
                                top: 412,
                                left: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isblack(
                                          const Color.fromARGB(255, 53, 53, 53),
                                          const Color.fromARGB(
                                              255, 241, 241, 241)),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(50),
                                          bottomRight: Radius.circular(50))),
                                  width: 20,
                                  height: 40,
                                )),
                            Positioned(
                                top: 412,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isblack(
                                          const Color.fromARGB(255, 53, 53, 53),
                                          const Color.fromARGB(
                                              255, 241, 241, 241)),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50))),
                                  width: 20,
                                  height: 40,
                                )),
                          ],
                        ),
                      )),
                ),
              ],
            );
          } else {
            return const Text("");
          }
        }
      }),
    );
  }
}
