import 'package:flutter/material.dart';

import '../../shared/hieght.dart';

class HomeDash1 extends StatelessWidget {
  const HomeDash1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
              ),
              height: 500,
              child: ListView(
                children: [
                  Wrap(runSpacing: 20, spacing: 5, children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 210, 224, 255),
                              blurRadius: 22,
                              offset: Offset(10, 30))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 151, 172, 255),
                      ),
                      width: 250,
                      height: 160,
                    ),
                    wid(30),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 210, 224, 255),
                              blurRadius: 22,
                              offset: Offset(10, 30))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 151, 172, 255),
                      ),
                      width: 250,
                      height: 160,
                    ),
                    wid(30),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 210, 224, 255),
                              blurRadius: 22,
                              offset: Offset(10, 30))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 151, 172, 255),
                      ),
                      width: 250,
                      height: 160,
                    ),
                    wid(30),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 210, 224, 255),
                              blurRadius: 22,
                              offset: Offset(10, 30))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 151, 172, 255),
                      ),
                      width: 250,
                      height: 160,
                    ),
                  ]),
                ],
              ),
            ),
            hieght(20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: const Color.fromARGB(255, 194, 206, 255),
            //         ),
            //         width: 550,
            //         height: 400,
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: const Color.fromARGB(255, 194, 206, 255),
            //         ),
            //         width: 550,
            //         height: 400,
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
