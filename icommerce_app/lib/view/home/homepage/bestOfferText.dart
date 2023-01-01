import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:widget/constant/color.dart';

import '../../../shared/hieght.dart';
import '../../../shared/isBlack.dart';

class BestOfferTextWidget extends StatelessWidget {
  final String text;
  final Function() fun;
  const BestOfferTextWidget({super.key, required this.text, required this.fun});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(

          child: Text(
            text,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "cairo"),
          ),
        ),
  
         Positioned(
              right: 7,
              child: InkWell(
                onTap:fun,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "View all",
                    style: TextStyle(
                        fontSize: 15, fontFamily: "cairo", color: colorbutton),
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
