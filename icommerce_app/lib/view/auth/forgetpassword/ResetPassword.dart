import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/function/validInput.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/widget/auth/buttomAuth.dart';
import 'package:widget/widget/auth/textbody.dart';
import 'package:widget/shared/textFild.dart';

import '../../../controller/auth/RestPassword.dart';
import '../../../controller/auth/SingupController.dart';
import '../../../widget/auth/texttitle.dart';

class ResetPassword extends GetView<SingUpController> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    RestPasswordController control = Get.put(RestPasswordController());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:appbarfunction("Reset password"),
      body: Form(
        key: control.form,
        child: ListView(
          children: [
                         hieght(30),
            Container(
              child: Image.asset(
                "images/forgotPassword.png",
                width: w / 2,
                height: w / 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hieght(30),
                    const TextTitle(text: "New Password"),
                    const TextBody(bodytext: "Please Enter New Password"),
                    hieght(30),
                    GetBuilder<RestPasswordController>(builder: (controllere) {
                      return Edittext(
                          validator: (val) {
                            return valideInbut(val!, 5, 18, "password");
                          },
                          obescure: controllere.obs,
                          labele: "Password",
                          hint: 'Enter your password',
                          icon: IconButton(
                            icon: const Icon(Icons.remove_red_eye_sharp),
                            onPressed: () {
                              controllere.echangeObsucr();
                            },
                          ),
                          controller: control.password);
                    }),
                    hieght(25),
                    GetBuilder<RestPasswordController>(builder: (controllere) {
                      return Edittext(
                          validator: (val) {
                            return valideInbut(val!, 5, 18, "password");
                          },
                          labele: "confirme password",
                          obescure: controllere.obs,
                          hint: 'Confirme password',
                          icon: IconButton(
                            icon: const Icon(Icons.remove_red_eye_sharp),
                            onPressed: () {
                              controllere.echangeObsucr();
                            },
                          ),
                          controller: control.confirmpassword);
                    }),
                    hieght(40),
                    ButtonAut(
                      name: "Save",
                      onPressed: () {
                        control.changepassword();
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
