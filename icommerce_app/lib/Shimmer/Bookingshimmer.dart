import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget/main.dart';
import 'package:widget/shared/hieght.dart';

class Booking_shimmer extends StatelessWidget {
  const Booking_shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 500.0,
        height: 150.0,
        child: Shimmer.fromColors(
            baseColor: shardp!.getString("themeColor") == "ThemeData#7e127"
                ? const Color.fromARGB(255, 95, 95, 95)
                : const Color.fromARGB(255, 226, 226, 226),
            highlightColor: shardp!.getString("themeColor") == "ThemeData#7e127"
                ? const Color.fromARGB(255, 119, 119, 119)
                : const Color.fromARGB(255, 203, 203, 203),
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 177, 177, 177)),
                ),
                wid(20),
                Positioned(
                  left: 150,
                  top: 10,
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.black,
                      ),
                      hieght(22),
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.black,
                      ),
                      hieght(22),
                      Container(
                        width: 100,
                        height: 20,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 10,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        width: 100,
                        height: 40,
                      ),
                      hieght(22),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
