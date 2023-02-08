import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/shared/button.dart';
import 'package:widget/shared/isBlack.dart';

import '../../../controller/home/hotel/detailsController.dart';
import '../../../function/Situations.dart';
import '../../../shared/hieght.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (de) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Container(
          padding: const EdgeInsets.only(left: 9, right: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hieght(10),
              const Text(
                "Description",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold),
              ),
              ReadMoreText(
                de.description.toString(),
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "cairo",
                    fontWeight: FontWeight.w500,
                    color: isblack(const Color.fromARGB(255, 255, 255, 255),
                        const Color.fromARGB(255, 114, 114, 114))),
                trimLines: 3,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: colorbutton),
                lessStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: colorbutton),
              ),
              const Text(
                "Situations",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold),
              ),
              GetBuilder<DetailsController>(builder: (cont) {
                return Center(
                  child: Wrap(
                    runSpacing: 5.0,
                    spacing: 10.0,
                    
                    direction: Axis.horizontal,
                    children: [
                      ...List.generate(
                          cont.situations.length,
                          (i) => SizedBox(
                                width: 100,
                                height: 50,
                                child: Row(
                                  children: [
                                    Icon(
                                      situations(cont.situations[i].toString()),
                                      color: colorbutton,
                                    ),
                                    wid(5),
                                    Text(
                                      cont.situations[i].toString(),
                                      style: TextStyle(
                                        color: colorbutton,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                    ],
                  ),
                );
              }),
              ButtonFun(
                  "view all",
                  isblack(const Color.fromARGB(255, 84, 84, 84),
                      const Color.fromARGB(255, 223, 223, 223)),
                  double.infinity,
                  50,
                  () {},
                  isblack(const Color.fromARGB(255, 204, 204, 204),
                      const Color.fromARGB(255, 77, 77, 77)),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: isblack(const Color.fromARGB(255, 204, 204, 204),
                        const Color.fromARGB(255, 77, 77, 77)),
                  ),
                  null),
            ],
          ),
        ),
      );
    });
  }
}
