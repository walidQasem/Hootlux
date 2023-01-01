import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/shared/hieght.dart';

import '../../../class/staturequest.dart';
import '../../../controller/home/hotel/detailsController.dart';
import '../homepage/gallry.dart';

class ImagesP extends StatelessWidget {
  const ImagesP({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (con) {
      if (con.statusRequest == StatusRequest.success && con.images.isEmpty==false) {
        return Positioned(
            bottom: 40,
            right: 30,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        con.images[0]['url_image'].toString(),
                        fit: BoxFit.cover,
                      )),
                ),
                hieght(10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        con.images[1]['url_image'].toString(),
                        fit: BoxFit.cover,
                      )),
                ),
                hieght(10),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        con.images[2]['url_image'].toString(),
                        fit: BoxFit.cover,
                      )),
                ),
                hieght(10),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => const Gallry(),
                            arguments: {"id": con.id.toString()});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black),
                        child: AnimatedOpacity(
                          opacity: 0.4,
                          duration: const Duration(milliseconds: 500),
                          child: Container(
                            decoration: const BoxDecoration(),
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1596701062351-8c2c14d1fdd0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 18,
                        left: 23,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const Gallry(),
                                arguments: {"id": con.id.toString()});
                          },
                          child: Text(
                            "${con.images.length - 3}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                )
              ],
            ));
      } else {
        return const Text("");
      }
    });
  }
}
