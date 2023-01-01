import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/auth/singin.dart';
import 'package:widget/widget/auth/buttomAuth.dart';
import 'package:widget/widget/auth/textbody.dart';
import 'package:widget/widget/auth/texttitle.dart';

class SuccesSingup extends StatelessWidget {
  const SuccesSingup({super.key});

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
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal:15),
            child: Column(
              children: [
                Center(
                    child: Image.asset("images/congratulation.png",
                        width: w/1.9, height:h/3,)),
                      const TextTitle(text:"congratulation"),
                      const TextBody(bodytext:"Succsfully Registred"),
                      hieght(30),
                ButtonAut(
                  name: "Sing in",
                  onPressed: () {
                    Get.offAll(() => Singin(),transition:Transition.downToUp);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
