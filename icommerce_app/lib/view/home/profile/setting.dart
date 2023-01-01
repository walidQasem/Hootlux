import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/hieght.dart';

import '../../../locale/localeController.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
      MylocalController  controller =  Get.put(MylocalController());
    return Scaffold(
      appBar: appbarfunction("5".tr),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          InkWell(
            onTap: () {
              Get.bottomSheet(Container(
                height:100,
                decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20))),
                child:Column(children: [
                  TextButton(onPressed: (){
                     controller.changeLangue("ar");
                  }, child:const Text("عربية",style: TextStyle(fontFamily: "cairo"))),
                      TextButton(onPressed: (){
                        controller.changeLangue("en");
                      }, child:const Text("English",style: TextStyle(fontFamily: "cairo"))),
                ]),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [const Icon(Icons.language,size:30,),
                wid(10),
                 Text("4".tr,style: TextStyle(fontFamily: "cairo",fontSize:17,fontWeight: FontWeight.bold),)],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
