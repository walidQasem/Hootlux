import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/home/hotel/detailsController.dart';

class ImageP extends StatelessWidget {
  const ImageP({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (de) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 0, 1, 32)),
          child: AnimatedOpacity(
            opacity: 0.6,
            duration: const Duration(seconds: 1),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  de.img.toString(),
                  fit: BoxFit.cover,
                  width: 900,
                  height: 900,
                )),
          ),
        ),
      );
    });
  }
}
