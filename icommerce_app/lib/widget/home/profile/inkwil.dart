import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget/shared/hieght.dart';

InkWell inkWell(Icon icon, String title,Function() s) {
  return InkWell(
    
    onTap:s,
    child: Row(children: [
     icon, 
     wid(30),
     Text(title,style:TextStyle(fontWeight: FontWeight.bold,fontSize:16,fontFamily:"cairo"),), 
    
    ]),
  );
}
