import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextBottom extends StatelessWidget {
  final String parag;
  final String type;
  const TextBottom({super.key, required this.parag, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      AutoSizeText(
        parag,
      ),
     AutoSizeText(type,
          style: const TextStyle(
              color: Color.fromARGB(255, 55, 161, 255)
               ,fontFamily:"cairo",
              fontWeight: FontWeight.bold))
    ]);
  }
}
