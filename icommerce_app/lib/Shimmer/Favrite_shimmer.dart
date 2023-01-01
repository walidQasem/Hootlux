import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widget/main.dart';
import 'package:widget/shared/hieght.dart';

class Favorite_shimmer extends StatelessWidget {
  const  Favorite_shimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      height: 150.0,
      child: Shimmer.fromColors(
        baseColor: shardp!.getString("themeColor") =="ThemeData#7e127"? Color.fromARGB(255, 95, 95, 95):Color.fromARGB(255, 226, 226, 226),
        highlightColor: shardp!.getString("themeColor") =="ThemeData#7e127"? Color.fromARGB(255, 119, 119, 119):Color.fromARGB(255, 203, 203, 203),
        child:Row(
          children: [

          Container(  
            width:130,
            height: 130,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 177, 177, 177)),
          ),

         wid(20),
         Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Container(  
            width:220,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 177, 177, 177)),
          ),
          hieght(20),
          
          Container(  
            width:220,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 177, 177, 177)),
          ),
                  hieght(20),
          Container(  
            width:220,
            height: 30,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 177, 177, 177)),
          )
          
          
          ],
         )
       
        ],)
        ),
    );
  }
}
