import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget/main.dart';

class Home_shimmer extends StatelessWidget {
  const Home_shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 320.0,
        child: Shimmer.fromColors(
            baseColor: shardp!.getString("themeColor") == "ThemeData#7e127"
                ? const Color.fromARGB(255, 95, 95, 95)
                : const Color.fromARGB(255, 226, 226, 226),
            highlightColor: shardp!.getString("themeColor") == "ThemeData#7e127"
                ? const Color.fromARGB(255, 119, 119, 119)
                : const Color.fromARGB(255, 203, 203, 203),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(5, (i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: 290,
                      height: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 177, 177, 177)),
                    ),
                  );
                })
              ],
            )),
      ),
    );
  }
}
