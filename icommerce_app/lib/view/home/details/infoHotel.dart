import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/home/hotel/detailsController.dart';
import 'package:widget/shared/hieght.dart';

class InfoHotel extends StatelessWidget {
  const InfoHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(builder: (de) {
      return Positioned(
        bottom: 40,
        left: 30,
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DefaultTextStyle(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  pause:Duration(seconds: 10),

                  animatedTexts: [
                    TyperAnimatedText('Grand palace Hotel Farah'),
                  ],
                )),
            Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: Color.fromARGB(255, 242, 242, 242),
                  size: 20,
                ),
                wid(10),
                const Text(
                  "Safi-Casablanca",
                  style: TextStyle(
                    fontFamily: "Cairo",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rate_rounded,
                  color: Color.fromARGB(255, 255, 167, 59),
                ),
                wid(5),
                Text(
                  de.rating.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Cairo",
                  ),
                ),
                wid(2),
                const Text(
                  "(2k reviews)",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: "Cairo",
                  ),
                )
              ],
            ),
          ]),
        ),
      );
    });
  }
}
