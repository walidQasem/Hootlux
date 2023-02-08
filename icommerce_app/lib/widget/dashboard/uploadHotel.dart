import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/shared/appBar.dart';

import '../../controller/dashboard/uploadController.dart';

class UploadHotel extends StatelessWidget {
  const UploadHotel({super.key});

  @override
  Widget build(BuildContext context) {
    UploadController ss = Get.put(UploadController());
    return Scaffold(
      appBar: appbarfunction("Upload Hotel"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<UploadController>(builder: (conte) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      const Color.fromARGB(255, 235, 235, 235)),
                              child: const Icon(Icons.cloud_upload_outlined),
                            ),
                          ),
                        ),
                        ...List.generate(conte.widgetList.length, (i) {
                          return InkWell(
                              onTap: () {
                                Get.snackbar("$i", "ok");
                              },
                              child: conte.widgetList[i]);
                        }),
                        IconButton(
                            onPressed: () {
                              ss.plus();
                            },
                            icon: const Icon(Icons.add_box_outlined))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
