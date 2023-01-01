import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:widget/view/auth/singin.dart';
import 'package:widget/widget/auth/buttomAuth.dart';

class Succes extends StatelessWidget {
  const Succes({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Succes")),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:15),
        child: Column(
          children: [
            Center(
                child: Image.asset("images/succes.png",
                    width: w / 1.1, height: h / 1.5)),
            ButtonAut(
              name: "Sing in",
              onPressed: () {
                Get.offAll(() => Singin(),transition:Transition.downToUp);
              },
            )
          ],
        ),
      ),
    );
  }
}
