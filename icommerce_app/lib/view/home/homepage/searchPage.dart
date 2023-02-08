import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/text.dart';
import 'package:widget/widget/home/homePage/card_Hotel_Search.dart';

import '../../../controller/home/search/searchController.dart';
import '../../../shared/button.dart';
import '../../../shared/isBlack.dart';
import '../../../shared/textFild.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SearcheCotroller getContollerSearch = Get.put(SearcheCotroller());
    return Scaffold(
      appBar: appbarfunction("Search"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<SearcheCotroller>(builder: (cont) {
          return ListView(children: [
            hieght(25),
            Edittext(
              validator: (val) {
                return null;
              },
              labele: "",
              onChanged: (val) {
                cont.search(val);
              },
              controller: getContollerSearch.searchInput,
              obescure: false,
              icon: IconButton(
                icon: const Icon(Icons.filter_list_rounded),
                onPressed: () {
                  Get.bottomSheet(
                      GetBuilder<SearcheCotroller>(builder: (controller) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      height: 300,
                      decoration: BoxDecoration(
                          color: isblack(const Color.fromARGB(255, 70, 70, 70),
                              const Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 70,
                              height: 5,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 152, 152, 152),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          hieght(15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: text(
                                "Graph numerical reasoning",
                                const Color.fromARGB(255, 169, 169, 169),
                                13,
                                FontWeight.bold),
                          ),
                          hieght(5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:
                                text("Pric", Colors.white, 15, FontWeight.bold),
                          ),
                          RangeSlider(
                            min: 50,
                            max: 1000,
                            labels: RangeLabels(
                              controller.values.start.round().toString(),
                              controller.values.end.round().toString(),
                            ),
                            divisions: 500,
                            values: controller.values,
                            onChanged: (val) {
                              controller.onchageRange(val);
                            },
                          ),
                          hieght(10),
                          // Text("Hello${controller.values.start.toInt()}"),
                          // Text("Hello${controller.values.end.toInt()}"),
                          ButtonFun(
                              "  Filtrer", colorbutton, double.infinity, 50,
                              () {
                            controller.filterSearch();
                            Get.back();
                          }, null, const Icon(Icons.filter), null),
                          hieght(10),
                          ButtonFun(
                              "  restore", Colors.grey, double.infinity, 50,
                              () {
                            controller.restoreFilter();
                          }, null, const Icon(Icons.restore), null),
                        ],
                      ),
                    );
                  }));
                },
              ),
              hint: 'Search',
              prifixicon: const Icon(
                Icons.search,
              ),
            ),
            hieght(20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: text("Filtered results (${cont.filterResult})",
                  isblack(Colors.white, Colors.black), 15, FontWeight.bold),
            ),
            ...List.generate(getContollerSearch.dataHotel.length, (cote) {
              return CardSearchHotel(
                dataHotel: cont.dataHotel[cote],
              );
            }),
            Text(cont.vale.toString())
          ]);
        }),
      ),
    );
  }
}
