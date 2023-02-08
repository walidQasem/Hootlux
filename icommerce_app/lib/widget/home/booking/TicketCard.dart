import 'package:flutter/material.dart';
import 'package:widget/shared/text.dart';

class TicketCard extends StatelessWidget {
  const TicketCard(
      {super.key, this.keye1, this.value1, this.keye2, this.value2});
  final String? keye1;
  final String? value1;
  final String? keye2;
  final String? value2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Stack(
        children: [
          const Text(""),
          Positioned(
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(keye1!, const Color.fromARGB(255, 199, 208, 255), 13,
                      FontWeight.bold),
                  text(value1!, Colors.white, 14, FontWeight.bold),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(keye2!, const Color.fromARGB(255, 199, 208, 255), 13,
                      FontWeight.bold),
                  text(value2!, Colors.white, 14, FontWeight.bold),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
