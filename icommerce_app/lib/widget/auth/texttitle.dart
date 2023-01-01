import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextTitle extends StatelessWidget {
  final String text;
  const TextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText(
         maxLines: 1,
            textAlign:TextAlign.center,
        text,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold ,fontFamily:"cairo",),
      ),
    );
  }
}
