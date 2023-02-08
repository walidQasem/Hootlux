import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/home/hotel/detailsController.dart';
import 'package:widget/view/home/details/ButtonBooking.dart';
import 'package:widget/view/home/details/Commentaire.dart';
import 'package:widget/view/home/details/category.dart';
import 'package:widget/view/home/details/infoHotel.dart';
import 'package:widget/view/home/details/location.dart';
import 'package:widget/view/home/details/overview.dart';

import '../details/image.dart';
import '../details/images.dart';

class DetailsHotel extends StatelessWidget {
  const DetailsHotel({super.key});
  @override
  Widget build(BuildContext context) {
    DetailsController de = Get.put(DetailsController());
    PageController pg = PageController(viewportFraction: 0.5);
    List<Widget> listColors = [
      const Overview(),
      Commentaire(),
      const Location()
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 100,
            padding: const EdgeInsets.all(0.0),
            child: ListView(
              children: [
                Column(children: [
                  SizedBox(
                    height: 490,
                    child: GetBuilder<DetailsController>(builder: (cont) {
                      return Stack(
                        children: [
                          const ImageP(),
                          Positioned(
                              top: 30,
                              right: 30,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(0.4)),
                                width: 43,
                                height: 43,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.bookmark_border_outlined,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  onPressed: () {},
                                ),
                              )),
                          Positioned(
                              top: 30,
                              left: 30,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(0.4)),
                                width: 43,
                                height: 43,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              )),
                          const InfoHotel(),
                          const ImagesP(),
                        ],
                      );
                    }),
                  )
                ]),
                const CategoryP(),
                GetBuilder<DetailsController>(builder: (cot) {
                  return listColors.elementAt(cot.index1);
                })
              ],
            ),
          ),
          const BokingButoon()
        ],
      ),
    );
  }
}
