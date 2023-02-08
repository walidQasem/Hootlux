import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:widget/constant/url.dart';

import '../../../model/Hotel/Hotel_Model.dart';

class Card_Hotel_dash extends StatelessWidget {
  final Data_Class_Hotel dataHotel;
  const Card_Hotel_dash({super.key, required this.dataHotel});

  @override
  Widget build(BuildContext context) {
    List imge = jsonDecode(dataHotel.imgHotel.toString());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                width: 180,
                height: 180,
                child: AnimatedOpacity(
                  opacity: 0.9,
                  duration: const Duration(milliseconds: 700),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "$root/ecommerce/image/${imge[0].toString()}",
                        width: 120,
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(
              //         width: 120,
              //         child: Text(
              //           maxLines: 2,
              //           dataHotel.nomHotel.toString(),
              //           style: const TextStyle(
              //               fontFamily: "cairo",
              //               fontSize: 17,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       hieght(5),
              //     ],
              //   ),
              // ),
            ]),
          ),
        ),
      ],
    );
  }
}
