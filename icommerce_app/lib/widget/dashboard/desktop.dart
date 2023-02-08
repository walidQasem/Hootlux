import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/widget/dashboard/cardDashboardInformation.dart';

import '../../controller/dashboard/dashboardController.dart';
import '../../shared/button.dart';
import '../../shared/text.dart';

class DesktopD extends StatelessWidget {
  const DesktopD({super.key});

  @override
  Widget build(BuildContext context) {
    DashBoardController gg = Get.put(DashBoardController());
    return Row(
      children: [
        GetBuilder<DashBoardController>(builder: (con) {
          return Column(
            children: [
              ...List.generate(
                  con.listst.length,
                  (index) => InkWell(
                        onTap: () {
                          con.changeIndex(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: con.listst[index] == "Currently"
                                    ? Colors.brown
                                    : con.listst[index] == "Completed"
                                        ? Colors.green
                                        : Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              con.listst[index] == "Currently"
                                  ? Icons.access_time
                                  : con.listst[index] == "Completed"
                                      ? Icons.verified_outlined
                                      : Icons.cancel_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ))
            ],
          );
        }),
        Expanded(
          child: SizedBox(
            width: 100,
            height: MediaQuery.of(context).size.height,
            child: SmartRefresher(
              onRefresh: () => gg.get_data(),
              controller: gg.r,
              header: WaterDropHeader(
                waterDropColor: colorbutton,
                completeDuration: Duration.zero,
              ),
              child: GetBuilder<DashBoardController>(builder: (conte) {
                if (conte.dataBasice.isEmpty) {
                  return Column(
                    children: [
                      hieght(120),
                      Image.asset(
                        "images/avatar.png",
                        width: 400,
                      ),
                      text(
                          "No Information",
                          const Color.fromARGB(255, 139, 166, 255),
                          25,
                          FontWeight.bold),
                    ],
                  );
                }
                if (conte.st == StatusRequest.loading) {
                  return const Text("Loading");
                } else {
                  if (conte.st == StatusRequest.success &&
                      conte.dataBasice.isNotEmpty &&
                      conte.info.isNotEmpty) {
                    return SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Accordion(
                                  headerBackgroundColorOpened: Colors.black54,
                                  scaleWhenAnimating: true,
                                  openAndCloseAnimation: true,
                                  contentBorderColor: Colors.white,
                                  headerPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  children: [
                                    ...List.generate(conte.dataBasice.length,
                                        (index) {
                                      return AccordionSection(
                                        leftIcon: const Icon(Icons
                                            .arrow_drop_down_circle_outlined),
                                        headerBackgroundColor: conte
                                                    .listst[conte.indexListe] ==
                                                "Currently"
                                            ? const Color.fromARGB(
                                                255, 255, 215, 175)
                                            : conte.listst[conte.indexListe] ==
                                                    "Completed"
                                                ? const Color.fromARGB(
                                                    255, 224, 255, 225)
                                                : const Color.fromARGB(
                                                    255, 255, 198, 194),
                                        headerBackgroundColorOpened:
                                            const Color.fromARGB(
                                                255, 188, 206, 255),
                                        header: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: SizedBox(
                                                      width: 60,
                                                      height: 60,
                                                      child: Image.asset(
                                                        "images/avatar.png",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  wid(15),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      text(
                                                          "#1515422",
                                                          const Color.fromARGB(
                                                              255,
                                                              119,
                                                              119,
                                                              119),
                                                          13,
                                                          FontWeight.bold),
                                                      text(
                                                          conte.info[index][
                                                                  "username_user"]
                                                              .toString(),
                                                          const Color.fromARGB(
                                                              255, 40, 40, 40),
                                                          14,
                                                          FontWeight.bold),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              text(
                                                  "065",
                                                  const Color.fromARGB(
                                                      255, 116, 116, 116),
                                                  14,
                                                  FontWeight.w700),
                                              text(
                                                  conte.dataBasice[index]
                                                          ["date_booking"]
                                                      .toString(),
                                                  const Color.fromARGB(
                                                      255, 116, 116, 116),
                                                  14,
                                                  FontWeight.w700),
                                              text(
                                                  conte.dataBasice[index]
                                                          ["date_start"]
                                                      .toString(),
                                                  const Color.fromARGB(
                                                      255, 116, 116, 116),
                                                  14,
                                                  FontWeight.w700),
                                              text(
                                                  conte.dataBasice[index]
                                                          ["date_end"]
                                                      .toString(),
                                                  const Color.fromARGB(
                                                      255, 116, 116, 116),
                                                  14,
                                                  FontWeight.w700),
                                              text(
                                                  conte.dataBasice[index]
                                                          ["status"]
                                                      .toString(),
                                                  conte.dataBasice[index]
                                                                  ["status"]
                                                              .toString() ==
                                                          "Currently"
                                                      ? const Color.fromARGB(
                                                          255, 189, 125, 72)
                                                      : conte.dataBasice[index]
                                                                      ["status"]
                                                                  .toString() ==
                                                              "Completed"
                                                          ? const Color
                                                                  .fromARGB(
                                                              255, 46, 133, 0)
                                                          : const Color
                                                                  .fromARGB(
                                                              255, 255, 5, 5),
                                                  14,
                                                  FontWeight.w700),
                                              InkWell(
                                                onTap: () {
                                                  conte.remove(index);
                                                },
                                                child: Container(
                                                  width: 35,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: const Icon(
                                                    Icons
                                                        .remove_circle_outline_sharp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        content:
                                            GetBuilder<DashBoardController>(
                                                builder: (controlller) {
                                          if (controlller.ifo ==
                                              StatusRequest.loading) {
                                            return const CircularProgressIndicator();
                                          } else {
                                            if (controlller.ifo ==
                                                StatusRequest.success) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CardDashBoardInformation(
                                                        keyy: 'Name',
                                                        values: controlller
                                                                .info[index]
                                                            ["username_user"],
                                                      ),
                                                      CardDashBoardInformation(
                                                        keyy: 'Phone',
                                                        values: controlller
                                                                .info[index]
                                                            ["phone_user"],
                                                      ),
                                                      CardDashBoardInformation(
                                                        keyy: 'Name',
                                                        values: controlller
                                                                .info[index]
                                                            ["username_user"],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CardDashBoardInformation(
                                                          keyy:
                                                              'dataBasice start',
                                                          values:
                                                              conte.dataBasice[
                                                                      index][
                                                                  "date_start"]),
                                                      CardDashBoardInformation(
                                                        keyy: 'Phone',
                                                        values: controlller
                                                                .info[index]
                                                            ["phone_user"],
                                                      ),
                                                      CardDashBoardInformation(
                                                        keyy: 'Name',
                                                        values: controlller
                                                                .info[index]
                                                            ["username_user"],
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CardDashBoardInformation(
                                                        keyy:
                                                            'Number childreen',
                                                        values: controlller
                                                            .dataBasice[index][
                                                                "Number_of_Children"]
                                                            .toString(),
                                                      ),
                                                      CardDashBoardInformation(
                                                        keyy: 'Number adult',
                                                        values: controlller
                                                            .dataBasice[index][
                                                                "number_of_adults"]
                                                            .toString(),
                                                      ),
                                                      CardDashBoardInformation(
                                                        keyy: 'Total Mont',
                                                        values: controlller
                                                            .dataBasice[index]
                                                                ["Total"]
                                                            .toString(),
                                                      )
                                                    ],
                                                  ),
                                                  Column(children: [
                                                    ButtonFun(
                                                        "Complited",
                                                        colorbutton,
                                                        200,
                                                        50, () {
                                                      conte.uploadStatus(
                                                          conte
                                                              .dataBasice[index]
                                                                  ["id_booking"]
                                                              .toString(),
                                                          "Completed");
                                                    },
                                                        null,
                                                        const Icon(Icons
                                                            .verified_outlined),
                                                        null),
                                                    hieght(15),
                                                    ButtonFun(
                                                        "canceled",
                                                        Colors.red,
                                                        200,
                                                        50, () {
                                                      conte.uploadStatus(
                                                          conte
                                                              .dataBasice[index]
                                                                  ["id_booking"]
                                                              .toString(),
                                                          "Canceled");
                                                    },
                                                        null,
                                                        const Icon(Icons
                                                            .cancel_outlined),
                                                        null),
                                                  ]),
                                                ],
                                              );
                                            }

                                            return const Text("");
                                          }
                                        }),
                                        contentHorizontalPadding: 20,
                                        contentBorderWidth: 1,
                                      );
                                    })
                                  ]),
                            ],
                          )),
                    );
                  }
                  return const Text("");
                }
              }),
            ),
          ),
        ),
      ],
    );
  }
}
