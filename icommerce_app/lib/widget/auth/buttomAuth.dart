import 'package:flutter/material.dart';
import 'package:widget/constant/color.dart';

class ButtonAut extends StatelessWidget {
  final String name;
  final Function()? onPressed;
  final Icon? icne;

  const ButtonAut({super.key, required this.name, this.onPressed, this.icne});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55,
        
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
          onPressed: onPressed,
          
          color: colorbutton,
          textColor: Colors.white,
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold ,fontFamily:"cairo",),
          ),
        ));
  }
}
