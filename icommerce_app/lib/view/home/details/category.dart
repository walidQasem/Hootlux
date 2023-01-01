import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/home/hotel/detailsController.dart';
import '../../../shared/isBlack.dart';

class CategoryP extends StatelessWidget {
  const CategoryP({super.key});

  @override
  Widget build(BuildContext context) {
       List<String> category = ["Overview", "Ratings", "Location"];
    return   GetBuilder<DetailsController>(builder: (co) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 200,
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              co.changeIndexC(index);
                              print(co.index1);
                            },
                            child: AnimatedContainer(
                              decoration: index == co.index1
                                  ? BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.2,
                                              color: isblack(
                                                  const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  const Color.fromARGB(
                                                      255, 54, 54, 54)))))
                                  : null,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              duration: const Duration(milliseconds: 500),
                              child: Text(
                                category[index],
                                style: TextStyle(
                                    fontFamily: "cairo",
                                    color: index == co.index1
                                        ? const Color.fromARGB(255, 0, 106, 255)
                                        : isblack(
                                            const Color.fromARGB(
                                                255, 245, 245, 245),
                                            const Color.fromARGB(
                                                255, 54, 54, 54)),
                                    fontSize: index == co.index1 ? 14 : 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ));
                      },
                    ),
                  );
                });
  }
}