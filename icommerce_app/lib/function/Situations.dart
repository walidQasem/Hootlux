import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

IconData? situations(String s) {
  if (s == "wifi") {
    return Icons.wifi;
  }
  if(s=="parking"){
        return Icons.local_parking_rounded;
  }
  if(s=="television"){
         return Icons.tv_rounded;
  }
  if(s=="Washer"){
     return Icons.waves;
  }
  if(s=="Air"){
      return Icons.ac_unit_rounded;
  }
  return null;
}
