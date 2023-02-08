import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/dashboard/dashboardController.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/text.dart';

import '../../function/validInput.dart';
import '../../shared/button.dart';
import '../../shared/isBlack.dart';
import '../../shared/textFild.dart';

class Concierge extends StatelessWidget {
  const Concierge({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<DashBoardController>(builder: (co) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              DataTable(
                dataRowHeight: 70,
                showBottomBorder: true,
                showCheckboxColumn: true,
                columns: [
                  const DataColumn(
                      numeric: true,
                      tooltip: "Images",
                      label: Text('images',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: text("id", const Color.fromARGB(255, 33, 33, 33),
                          16, FontWeight.bold)),
                  DataColumn(
                      label: text("name", const Color.fromARGB(255, 33, 33, 33),
                          16, FontWeight.bold)),
                  DataColumn(
                      label: text(
                          "Email",
                          const Color.fromARGB(255, 33, 33, 33),
                          16,
                          FontWeight.bold)),
                  DataColumn(
                      label: text(
                          "Phone",
                          const Color.fromARGB(255, 33, 33, 33),
                          16,
                          FontWeight.bold)),
                  DataColumn(
                      label: text("Date", const Color.fromARGB(255, 33, 33, 33),
                          16, FontWeight.bold)),
                  DataColumn(
                      label: text("Role", const Color.fromARGB(255, 33, 33, 33),
                          16, FontWeight.bold)),
                  DataColumn(
                      label: text("", const Color.fromARGB(255, 33, 33, 33), 24,
                          FontWeight.bold)),
                  DataColumn(
                      label: text("", const Color.fromARGB(255, 33, 33, 33), 24,
                          FontWeight.bold)),
                ],
                rows: [
                  ...List.generate(co.concierge.length, (i) {
                    return DataRow(
                        onSelectChanged: (f) {
                          print(f);
                        },
                        onLongPress: () {
                          print("object");
                        },
                        selected: true,
                        cells: [
                          DataCell(ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset("images/avatar.png")),
                          )),
                          DataCell(Text(
                            "${co.concierge[i]['id_user']}",
                            style: const TextStyle(
                                fontFamily: "cairo", fontSize: 15),
                          )),
                          DataCell(Text(
                            "${co.concierge[i]['username_user']}",
                            style: const TextStyle(
                                fontFamily: "cairo", fontSize: 15),
                          )),
                          DataCell(Text(
                            "${co.concierge[i]['email_user']}",
                            style: const TextStyle(
                                fontFamily: "cairo", fontSize: 15),
                          )),
                          DataCell(Text(
                            "${co.concierge[i]['phone_user']}",
                            style: const TextStyle(
                                fontFamily: "cairo", fontSize: 15),
                          )),
                          DataCell(Text(
                            "${co.concierge[i]['user_data_creat']}",
                            style: const TextStyle(
                                fontFamily: "cairo",
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                          DataCell(Text(
                            "${co.concierge[i]['role']}",
                            style: const TextStyle(
                                fontFamily: "cairo",
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          )),
                          DataCell(InkWell(
                            onTap: () {},
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red),
                              child: const Icon(
                                Icons.remove_circle_outline_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )),
                          DataCell(InkWell(
                            onTap: () {},
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(87, 45, 48, 132)),
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )),
                        ]);
                  })
                ],
              ),
              hieght(20),
              ButtonFun(
                  "Add Hotel  ",
                  isblack(
                      const Color.fromARGB(255, 255, 255, 255), colorbutton),
                  double.infinity,
                  50, () {
                Get.bottomSheet(Container(
                  height: 5600,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        Edittext(
                            validator: (val) {
                              return valideInbut(val!, 5, 18, "name");
                            },
                            labele: "",
                            obescure: false,
                            hint: 'Enter name',
                            prifixicon:
                                const Icon(Icons.person_outline_outlined),
                            controller: co.name),
                        hieght(15),
                        Edittext(
                            validator: (val) {
                              return valideInbut(val!, 5, 18, "name");
                            },
                            labele: "",
                            obescure: false,
                            hint: 'Enter email',
                            prifixicon: const Icon(Icons.email_outlined),
                            controller: co.email),
                        hieght(15),
                        Edittext(
                            validator: (val) {
                              return valideInbut(val!, 5, 18, "name");
                            },
                            labele: "",
                            obescure: false,
                            hint: 'Enter Phone',
                            prifixicon:
                                const Icon(Icons.phone_enabled_outlined),
                            controller: co.phone),
                        hieght(15),
                        Edittext(
                            validator: (val) {
                              return valideInbut(val!, 5, 18, "name");
                            },
                            labele: "",
                            obescure: false,
                            hint: 'Enter password',
                            prifixicon: const Icon(Icons.password),
                            controller: co.password),
                        hieght(15),
                        Edittext(
                            validator: (val) {
                              return valideInbut(val!, 5, 18, "name");
                            },
                            labele: "",
                            obescure: false,
                            hint: 'Enter name',
                            prifixicon:
                                const Icon(Icons.person_outline_outlined),
                            controller: null),
                        hieght(15),
                        ButtonFun(
                            "Add Hotel  ",
                            isblack(const Color.fromARGB(255, 255, 255, 255),
                                colorbutton),
                            double.infinity,
                            50, () {
                          co.addConcierge();
                        },
                            isblack(const Color.fromARGB(255, 204, 204, 204),
                                const Color.fromARGB(255, 255, 255, 255)),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: isblack(
                                  const Color.fromARGB(255, 204, 204, 204),
                                  const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            null),
                      ],
                    ),
                  ),
                ));
              },
                  isblack(const Color.fromARGB(255, 204, 204, 204),
                      const Color.fromARGB(255, 255, 255, 255)),
                  Icon(
                    Icons.add_circle_outline_outlined,
                    color: isblack(const Color.fromARGB(255, 204, 204, 204),
                        const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  null),
            ],
          ),
        ),
      );
    });
  }
}
