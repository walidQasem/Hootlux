import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:widget/constant/rooteNamed.dart';
import 'package:widget/controller/auth/SinginController.dart';
import 'package:widget/controller/auth/forgetpasswordController.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/auth/singin.dart';
import 'package:widget/view/auth/forgetpassword/verifierCodeForgetPassword.dart';
import 'package:widget/widget/auth/buttomAuth.dart';
import 'package:widget/widget/auth/textbody.dart';
import 'package:widget/widget/auth/textbottm.dart';
import 'package:widget/shared/textFild.dart';

import '../../../controller/auth/SingupController.dart';
import '../../../function/validInput.dart';
import '../../../widget/auth/texttitle.dart';

class ForgetPassword extends GetView<ForgetPasswordController> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController control = Get.put(ForgetPasswordController());
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
          title: const Text("Forget Password",style:TextStyle(fontFamily:"cairo"),)),
      body: GetBuilder<ForgetPasswordController>(

        builder: (conttt) {
          return Container(child:conttt.isloading == false?Form(
            key: control.form,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 60),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                         Container(
                          child:Image.asset("images/checkEmail.png",width:w/2,height:w/2,),
                         ),

                        const TextTitle(text: "Forgot Password ?"),
                        const TextBody(
                            bodytext:
                                "Dont worry it happenes please enter the adresse associated with your account."),
                        hieght(25),
                        Edittext(
                            validator: (val) {
                              return valideInbut(val!, 5, 18, "email");
                            },
                            obescure: false,
                            hint: 'Enter your Email',
                            labele: "",
                            prifixicon:const Icon(Icons.email),
                            controller: control.email),
                        hieght(25),
                        hieght(10),
                        ButtonAut(
                            name: "Submit",
                            onPressed: () {
                              // Get.to(()=>VerifierCode(),arguments:{"email":control.email});
                              conttt.obvirefieremail();
                            }),
                      ]),
                ),
              ],
            ),
          ):Center(child:Lottie.network("https://assets4.lottiefiles.com/private_files/lf30_dqbik4tt.json",width:140)));
        }
      )
    );
  }
}
