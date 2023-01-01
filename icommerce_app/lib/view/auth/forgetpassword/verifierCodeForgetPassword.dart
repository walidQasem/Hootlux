import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:widget/constant/rooteNamed.dart';
import 'package:widget/controller/auth/SinginController.dart';
import 'package:widget/controller/auth/forgetpasswordController.dart';
import 'package:widget/controller/auth/verrificationForgetPassword.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/auth/singin.dart';
import 'package:widget/view/auth/forgetpassword/verifierCodeForgetPassword.dart';
import 'package:widget/widget/auth/buttomAuth.dart';
import 'package:widget/widget/auth/textbody.dart';
import 'package:widget/widget/auth/textbottm.dart';
import 'package:widget/shared/textFild.dart';

import '../../../controller/auth/SingupController.dart';
import 'ResetPassword.dart';
import '../../../widget/auth/texttitle.dart';

class VerifierCode extends StatelessWidget {
  const VerifierCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerificationForgetPasswordController control =
        Get.put(VerificationForgetPasswordController());
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
          title: const Text("verification Code",style:TextStyle(fontFamily:"cairo"),)),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 60),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TextTitle(text: "Verification Code"),
              const TextBody(bodytext: "We have send the code verification to"),
              hieght(10),
              Center(
                  child: Text(
                "${control.email}",
                style: const TextStyle(
                  fontFamily:"cairo",
                    color: Color.fromARGB(255, 131, 131, 131),
                    fontWeight: FontWeight.bold),
              )),
              hieght(20),
              OtpTextField(
                numberOfFields: 4,
                showFieldAsBox: true,
                enabledBorderColor: const Color.fromARGB(255, 135, 135, 135),
                borderWidth: 0.5,
                borderRadius: BorderRadius.circular(11),
                fieldWidth: 60,
                onCodeChanged: (String code) {},
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  control.onvirifier(verificationCode);
                }, // end onSubmit
              ),
              hieght(25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Resend Code after:  ",style:TextStyle(fontFamily:"cairo"),), 
                  Text("1:40",style:TextStyle(color:Colors.red,fontFamily:"cairo"),)],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
