import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget/shared/hieght.dart';

flageColumn(String img, String nameFlage) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(

       padding:EdgeInsets.all(10),
       decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 240, 240, 240)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/$img",width:100,),
        hieght(20),
          Text(
            nameFlage,
            style: const TextStyle(fontWeight: FontWeight.bold ,fontFamily:"cairo",),
          )
        ],
      ),
    ),
  );
}
