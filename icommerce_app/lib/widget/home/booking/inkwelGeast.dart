import 'package:flutter/material.dart';

import '../../../shared/hieght.dart';

class InkwemGeast extends StatelessWidget {
  const InkwemGeast({super.key, this.onTap1, this.onTap2, required this.text});
  final Function()? onTap1;
  final Function()? onTap2;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          InkWell(
            onTap: onTap1,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.remove,
                color: Color.fromARGB(255, 77, 77, 77),
              ),
            ),
          ),
          wid(15),
          Text(
            text,
            style: const TextStyle(
                fontFamily: "Cairo", fontWeight: FontWeight.bold),
          ),
          wid(15),
          InkWell(
            onTap: onTap2,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 77, 77, 77),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
