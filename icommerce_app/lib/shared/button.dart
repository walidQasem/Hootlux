import 'package:flutter/material.dart';
import 'package:widget/shared/hieght.dart';

// ignore: non_constant_identifier_names
Container ButtonFun(
  String text,
  Color colorss,
  double? w,
  double h,
  Function()? onPressed,
  Color? s,
  Icon cc,
  Color? colorText,
) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    width: w,
    height: h,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: onPressed,
        color: colorss,
        textColor: colorText ?? Colors.white,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cc,
              wid(3),
              Text(
                text,
                style: TextStyle(
                    color: s,
                    fontFamily: "cairo",
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
    ),
  );
}
