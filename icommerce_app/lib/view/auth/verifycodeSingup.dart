import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:widget/constant/rooteNamed.dart';
import 'package:widget/controller/auth/SinginController.dart';
import 'package:widget/controller/auth/forgetpasswordController.dart';
import 'package:widget/controller/auth/verificationCodeSingup.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/auth/singin.dart';
import 'package:widget/view/auth/forgetpassword/verifierCodeForgetPassword.dart';
import 'package:widget/view/auth/succescodeSingup.dart';
import 'package:widget/widget/auth/buttomAuth.dart';
import 'package:widget/widget/auth/textbody.dart';
import 'package:widget/widget/auth/textbottm.dart';
import 'package:widget/shared/textFild.dart';

import '../../controller/auth/SingupController.dart';
import '../../../widget/auth/texttitle.dart';

class VerfiyCodeSingup extends StatelessWidget {
  const VerfiyCodeSingup({super.key});

  @override
  Widget build(BuildContext context) {
    VerificatioSingupController control =Get.put(VerificatioSingupController());

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
          title: const Text("Virefy Code")),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 60),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TextTitle(text: "Check email Code"),
              const TextBody(
                  bodytext:
                      "Sing in with email and password or continue with \n social media"),
              hieght(15),
              Center(
                  child: Text(
                control.email,
                style: const TextStyle(
                    color: Color.fromARGB(255, 113, 113, 113), fontSize: 17),
              )),
              hieght(22),
              OtpTextField(
                numberOfFields: 4,
                showFieldAsBox: true,
                enabledBorderColor: const Color.fromARGB(255, 255, 255, 255),
                borderWidth: 0,
                borderRadius: BorderRadius.circular(11),
                fieldWidth: 60,
                filled: true,
                fillColor: const Color.fromARGB(255, 240, 240, 240),
                onCodeChanged: (String code) {},
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  print(verificationCode);
                  control.verificode(verificationCode);
                }, // end onSubmit
              ),
              hieght(25),
            ]),
          ),
        ],
      ),
    );
  }
}
