import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget/main.dart';
import 'package:widget/shared/hieght.dart';

class Home_shimmer extends StatelessWidget {
  const Home_shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      height: 320.0,
      child: Shimmer.fromColors(
        baseColor: shardp!.getString("themeColor") =="ThemeData#7e127"? Color.fromARGB(255, 95, 95, 95):Color.fromARGB(255, 226, 226, 226),
        highlightColor: shardp!.getString("themeColor") =="ThemeData#7e127"? Color.fromARGB(255, 119, 119, 119):Color.fromARGB(255, 203, 203, 203),
        child:Column(
          children: [
          Container(  
            width:350,
            height: 220,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 177, 177, 177)),
          ),
          hieght(10),
            Container(  
            width:350,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 177, 177, 177)),
          ),


         hieght(10),
            Container(  
            width:350,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 177, 177, 177)),
          ),
        ],)
        ),
    );
  }
}
