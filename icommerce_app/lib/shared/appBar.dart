import 'package:flutter/material.dart';

AppBar appbarfunction(String title) {
  return AppBar(
      
    elevation:0,
    shadowColor: Colors.white,
    title:Text(title,style:TextStyle(fontFamily:"cairo"),),
    centerTitle: true,
    
  );
  
}
