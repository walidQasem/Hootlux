import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/main.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/view/auth/singin.dart';

class MobilD extends StatelessWidget {
  const MobilD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarfunction("Home"),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: colorDash,
              height: 200,
              child: IconButton(
                icon: const Icon(Icons.login),
                onPressed: () {
                  shardp!.remove("emailKey");
                  Get.off(() => const Singin());
                },
              ),
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (contex, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      color: colorDash,
                    ),
                  );
                }))
      ]),
    );
  }
}
