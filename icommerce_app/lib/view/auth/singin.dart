import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:widget/main.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/auth/forgetpassword/forgetpassword.dart';
import 'package:widget/widget/auth/buttomAuth.dart';
import 'package:widget/widget/auth/textbody.dart';
import 'package:widget/widget/auth/textbottm.dart';
import 'package:widget/shared/textFild.dart';

import '../../controller/auth/SinginController.dart';
import '../../function/alertExit.dart';
import '../../function/validInput.dart';
import '../../widget/auth/texttitle.dart';

class Singin extends GetView<SinginController> {
  const Singin({super.key});

  @override
  Widget build(BuildContext context) {
    SinginController control = Get.put(SinginController());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbarfunction("Sing in"),
      body: WillPopScope(
        onWillPop: alertExit,
        child: GetBuilder<SinginController>(builder: (context) {
          return context.isloading == false
              ? Form(
                  key: controller.form,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: AspectRatio(
                                  aspectRatio: w < 600 ? 13 / 9 : 5,
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.asset("images/undraw.png")),
                                ),
                              ),
                              hieght(20),
                              const TextTitle(text: "Login"),
                              const TextBody(
                                  bodytext: "Pleas sign in to continue "),
                              hieght(20),
                              Edittext(
                                  validator: (val) {
                                    return valideInbut(val!, 5, 18, "email");
                                  },
                                  labele: "",
                                  obescure: false,
                                  hint: 'Enter your Email',
                                  prifixicon: const Icon(Icons.email),
                                  controller: control.email),
                              hieght(25),
                              GetBuilder<SinginController>(
                                  init: SinginController(),
                                  builder: (controllere) {
                                    return Edittext(
                                      prifixicon: const Icon(Icons.lock),
                                      obescure: controllere.obs,
                                      labele: "",
                                      hint: "Enter your Password",
                                      icon: IconButton(
                                        icon: controller.icon,
                                        onPressed: () {
                                          controller.enchangeObsucr();
                                        },
                                      ),
                                      controller: control.password,
                                      validator: (val) {
                                        return valideInbut(
                                            val!, 5, 18, "password");
                                      },
                                    );
                                  }),
                              hieght(10),
                              Container(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => const ForgetPassword(),
                                        transition: Transition.leftToRight);
                                  },
                                  child: const Text(
                                    "Forget password",
                                    style: TextStyle(
                                      fontFamily: "cairo",
                                    ),
                                  ),
                                ),
                              ),
                              hieght(10),
                              ButtonAut(
                                name: "Sing in",
                                onPressed: () {
                                  context.singin();
                                  print(shardp!.getString("themeColor"));
                                },
                              ),

                              hieght(20),

                              // Row(

                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [

                              //    InkWell(
                              //     onTap:(){},
                              //      child: const SizedBox(
                              //       width:60,height: 60,
                              //       child: Card(child:Icon(Icons.facebook,size: 33,),)),
                              //    ),
                              //     InkWell(
                              //     onTap:(){},
                              //      child: const SizedBox(
                              //       width:60,height: 60,
                              //       child: Card(child:Icon(Icons.email,size: 33,),)),
                              //    ),
                              //     InkWell(
                              //     onTap:(){},
                              //      child: const SizedBox(
                              //       width:60,height: 60,
                              //       child: Card(child:Icon(Icons.apple,size: 33,),)),
                              //    ),
                              // ],),
                              hieght(5),
                              Container(
                                child: InkWell(
                                    onTap: () {
                                      context.singup();
                                    },
                                    child: const TextBottom(
                                      parag: "Dont't have  acount?",
                                      type: '  Sing Up',
                                    )),
                              ),
                            ]),
                      ),
                    ],
                  ),
                )
              : Center(child: Lottie.asset("assets/signin.json", width: 140));
        }),
      ),
    );
  }
}
