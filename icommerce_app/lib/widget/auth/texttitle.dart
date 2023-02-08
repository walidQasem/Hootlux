import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AutoSizeText(
        maxLines: 1,
        text,
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: "cairo",
        ),
      ),
    );
  }
}
