import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:widget/class/hotel/GaneratData.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/function/chnageStatuReq.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/view/home/booking/payment.dart';

import '../../../view/home/booking/Ticket.dart';

class BookingController extends GetxController {
  Favorite_data bok = Favorite_data(Get.find());
  String? idHotel;
  String? price;
  String? img;
  DateTime? stratDate = DateTime.now();
  DateTime? endDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  int indexEfant = 0;
  StatusRequest? st;
  int indexdult = 1;
  double some = 0;
  int nbr = 1;

  onchangedate(PickerDateRange d) {
    stratDate = d.startDate;
    endDate = d.endDate;

    if (stratDate != null && endDate != null) {
      nbr = endDate!.day - stratDate!.day;
    } else {
      nbr = 1;
    }

    update();
  }

  isvalidechn() {
    if (stratDate == endDate) {
      Get.rawSnackbar(
          backgroundColor: const Color.fromARGB(255, 83, 83, 83),
          margin: const EdgeInsets.all(20),
          borderRadius: 17,
          title: "Error !!",
          message: "Error entering the date");
      some = double.parse(price.toString());
    } else {
      Get.to(() => const Payment());
    }
  }

  getInformation() {
    idHotel = Get.arguments["idHotel"];
    price = Get.arguments["price"];
    img = Get.arguments["img"];
    some = double.parse(price.toString());
  }

  incrimentAdult() {
    indexdult++;
    if (indexdult > 5) {
      indexdult = 5;
    }
    calculerSome();
    update();
  }

  decrimentAdult() {
    indexdult--;
    if (indexdult <= 1) {
      indexdult = 1;
    }
    calculerSome();
    update();
  }

  incrimentEfant() {
    indexEfant++;
    if (indexEfant > 5) {
      indexEfant = 5;
    }
    calculerSome();
    update();
  }

  decrimenttEfant() {
    indexEfant--;
    if (indexEfant <= 0) {
      indexEfant = 0;
    }
    calculerSome();
    update();
  }

  oncready() {
    stratDate ??= DateTime.utc(1999, 00, 0);
    endDate ??= DateTime(stratDate!.year, stratDate!.month, stratDate!.day + 1);
  }

  changeDropDownEnfant(int e) {
    indexEfant = e;
    update();
  }

  changeDropDowndelt(int e) {
    indexdult = e;
    update();
  }

  calculerSome() {
    double ef = indexEfant * double.parse(price.toString());
    double ed = indexdult * double.parse(price.toString());
    some = ef + ed;
    some = some * nbr;
    update();
  }

  bookingAdd() async {
    st = StatusRequest.loading;
    // await Future.delayed(const Duration(seconds: 5));
    var res = await bok.add_Boking(idHotel.toString(), stratDate!, endDate!,
        indexEfant.toString(), indexdult.toString(), some.toString());
    st = chnageStatuReq(res);
    if (st == StatusRequest.success) {
      if (res['message'] == true) {
        Get.defaultDialog(
          content: Lottie.asset(
            "assets/succesBooking.json",
            width: 100,
          ),
          title: "Payment completed successfully",
          titleStyle: TextStyle(
              color: colorbutton,
              fontFamily: "cairo",
              fontWeight: FontWeight.bold,
              fontSize: 17),
          middleText: "",
          middleTextStyle: const TextStyle(fontFamily: "cairo"),
          confirm: SizedBox(
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: MaterialButton(
                minWidth: 30,
                height: 47,
                color: colorbutton,
                textColor: const Color.fromARGB(255, 235, 235, 235),
                onPressed: () {
                  Get.to(() => const Ticket(),
                      arguments: {"id_Hotel": idHotel.toString()});
                },
                child: const Text(
                  "  Confirme  ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontFamily: "cairo"),
                ),
              ),
            ),
          ),
          cancel: SizedBox(
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: MaterialButton(
                minWidth: 40,
                height: 47,
                color: isblack(const Color.fromARGB(255, 78, 78, 78),
                    const Color.fromARGB(255, 235, 235, 235)),
                textColor: Colors.white,
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "     cancel     ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "cairo",
                      color: colorbutton),
                ),
              ),
            ),
          ),
        );
      } else {}
    }
    update();
  }

  @override
  void onInit() {
    oncready();
    getInformation();
    super.onInit();
  }
}
