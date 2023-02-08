import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:widget/function/validInput.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/widget/auth/buttomAuth.dart';
import 'package:widget/widget/auth/textbody.dart';
import 'package:widget/shared/textFild.dart';

import '../../controller/auth/SingupController.dart';
import '../../widget/auth/texttitle.dart';

class Singup extends GetView<SingUpController> {
  const Singup({super.key});

  @override
  Widget build(BuildContext context) {
    SingUpController control = Get.put(SingUpController());
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
            title: const Text(
              "Sing up",
              style: TextStyle(
                fontFamily: "cairo",
              ),
            )),
        body: GetBuilder<SingUpController>(builder: (conttt) {
          return Container(
              child: conttt.isloading == false
                  ? Form(
                      key: controller.formSingup,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  hieght(10),
                                  const Center(
                                      child: TextTitle(text: "Welcom back")),
                                  const TextBody(
                                      bodytext:
                                          "Sing in with email and password or continue with \n social media"),
                                  hieght(40),
                                  Edittext(
                                    enabel: false,
                                    validator: (val) {
                                      return valideInbut(
                                          val!, 5, 15, "username");
                                    },
                                    labele: "",
                                    obescure: false,
                                    hint: 'Enter your Username',
                                    prifixicon: const Icon(
                                      Icons.person,
                                      size: 20,
                                    ),
                                    controller: control.username,
                                  ),
                                  hieght(20),
                                  Edittext(
                                      enabel: false,
                                      validator: (val) {
                                        return valideInbut(
                                            val!, 5, 50, "email");
                                      },
                                      obescure: false,
                                      labele: "",
                                      hint: 'Enter your Email',
                                      prifixicon: const Icon(
                                        Icons.email,
                                        size: 20,
                                      ),
                                      controller: control.email),
                                  hieght(20),
                                  Edittext(
                                      enabel: false,
                                      validator: (val) {
                                        return valideInbut(
                                            val!, 10, 50, "phone");
                                      },
                                      maxlent: 10,
                                      labele: "",
                                      type: "phone",
                                      obescure: false,
                                      prifixicon: const Icon(
                                        Icons.phone,
                                        size: 20,
                                      ),
                                      hint: 'Phone',
                                      controller: control.phone),
                                  hieght(20),
                                  GetBuilder<SingUpController>(
                                      builder: (controllere) {
                                    return Edittext(
                                        enabel: false,
                                        validator: (val) {
                                          return valideInbut(
                                              val!, 10, 15, "password");
                                        },
                                        obescure: controllere.obs,
                                        labele: "",
                                        hint: 'Enter your password',
                                        prifixicon: const Icon(
                                          Icons.lock,
                                          size: 20,
                                        ),
                                        icon: IconButton(
                                          icon: controller.icon,
                                          onPressed: () {
                                            conttt.echangeObsucr();
                                          },
                                        ),
                                        controller: control.password);
                                  }),
                                  hieght(20),
                                  GetBuilder<SingUpController>(
                                      builder: (controllere) {
                                    return Edittext(
                                        enabel: false,
                                        validator: (val) {
                                          return valideInbut(
                                              val!, 3, 15, "role");
                                        },
                                        obescure: false,
                                        labele: "",
                                        hint: 'Enter your role',
                                        prifixicon: const Icon(
                                          Icons.reddit_outlined,
                                          size: 20,
                                        ),
                                        controller: control.role);
                                  }),
                                  hieght(40),
                                  ButtonAut(
                                    name: "Sing up",
                                    onPressed: () {
                                      conttt.onverifycode();
                                    },
                                  ),
                                  hieght(5),
                                ]),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Lottie.network(
                          "https://assets4.lottiefiles.com/private_files/lf30_dqbik4tt.json",
                          width: 140)));
        }));
  }
}
