import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextBody extends StatelessWidget {
  final String bodytext;
  const TextBody({super.key, required this.bodytext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText(
         maxLines: 2,
         minFontSize: 15,
        bodytext,
        textAlign:TextAlign.center,
        style: const TextStyle( color: Color.fromARGB(255, 116, 116, 116), fontFamily:"cairo",),
      ),
    );
  }
}
