import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/controller/home/hotel/detailsController.dart';
import 'package:widget/main.dart';
import 'package:widget/shared/appBar.dart';
import 'package:photo_view/photo_view.dart';

class Gallry extends StatelessWidget {
  const Gallry({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsController g = Get.put(DetailsController());
    return Scaffold(
      appBar: appbarfunction("Gallry"),
      body: GetBuilder<DetailsController>(builder: (cont) {
        return GridView.count(
          crossAxisCount: 2,
          children: List.generate(cont.images.length, (index) {
            return Center(
                child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      body: PhotoView(
                        imageProvider: NetworkImage(
                            "$root/ecommerce/image/${cont.images[index].toString()}",
                            scale: 300),
                      ));
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "$root/ecommerce/image/${cont.images[index].toString()}",
                      fit: BoxFit.cover,
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return child;
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Shimmer.fromColors(
                            baseColor: shardp!.getString("themeColor") ==
                                    "ThemeData#7e127"
                                ? const Color.fromARGB(255, 95, 95, 95)
                                : const Color.fromARGB(255, 226, 226, 226),
                            highlightColor: shardp!.getString("themeColor") ==
                                    "ThemeData#7e127"
                                ? const Color.fromARGB(255, 119, 119, 119)
                                : const Color.fromARGB(255, 203, 203, 203),
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.grey,
                            ),
                          );
                        }
                      },
                    )),
              ),
            ));
          }),
        );
      }),
    );
  }
}
