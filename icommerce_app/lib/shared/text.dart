import 'package:flutter/material.dart';

Text text(String text, Color c, double size,FontWeight f) {
  return Text(
    text,
    style: TextStyle(color: c, fontSize: size, fontFamily: "cairo",fontWeight:f),
  );
}
