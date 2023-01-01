import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widget/constant/color.dart';

import '../../../shared/hieght.dart';
import '../../../shared/isArabic.dart';
import '../../../shared/isBlack.dart';

class HeaderPageHome extends StatelessWidget {
  const HeaderPageHome({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          
          height: 70,
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: colorOrange,
              ),
              Text(
                "   Marocco,Safi",
                style: TextStyle(
                    color: isblack(const Color.fromARGB(255, 233, 233, 233),
                        const Color.fromARGB(255, 118, 118, 118)),
                    fontFamily: "cairo",
                    fontWeight: FontWeight.bold),
              ),
   
             
            ],
          ),
        ),
         Positioned(
             right:isArabic(320, 10),
                top: 10,
                
                child: Stack(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_none_rounded,
                          color: isblack(const Color.fromARGB(255, 195, 195, 195),
                              Color.fromARGB(255, 69, 103, 167)),
                          size: 27,
                        )),
                    Positioned(
                        top: 6,
                        left: 25,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 79, 32),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(child: Text("2",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:11))),
                        ))
                  ],
                ),
              )
      ],
    );
  }
}
