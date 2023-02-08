import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  final String bodytext;
  const TextBody({super.key, required this.bodytext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AutoSizeText(
        maxLines: 2,
        minFontSize: 17,
        bodytext,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 116, 116, 116),
          fontFamily: "cairo",
        ),
      ),
    );
  }
}
