import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/constant/url.dart';
import 'package:widget/function/validInput.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/view/auth/verifycodeSingup.dart';
import 'package:widget/widget/auth/buttomAuth.dart';
import 'package:widget/widget/auth/textbody.dart';
import 'package:widget/widget/auth/textbottm.dart';
import 'package:widget/shared/textFild.dart';

import '../../class/crud.dart';
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
          title: const Text("Sing up",style: TextStyle( fontFamily:"cairo",),)),
      body:GetBuilder<SingUpController>(
        builder: (conttt) {
          return Container(
            child:conttt.isloading == false?Form(
            key:controller.formSingup,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
          
                        children: [
                      
                    hieght(10),
                        const TextTitle(text: "Welcom back"),
                              const TextBody(
                                  bodytext:
                                      "Sing in with email and password or continue with \n social media"),
                  //  Row(
                  //    children: [
                     
                  //      Stack(
                              
                  
                  //       children: [
                  //         Container(
                           
                  //           decoration:BoxDecoration(color: Color.fromARGB(255, 228, 228, 228),borderRadius: BorderRadius.circular(25))
                  //           ,
                          
                  //           child:conttt.image == null? ClipRRect(
                  //             borderRadius: BorderRadius.circular(20),
                  //             child: Icon(Icons.camera_enhance,size: 150,color: Color.fromARGB(255, 154, 154, 154),)
                  //             ): 
                  //           ClipRRect(
                  //              borderRadius: BorderRadius.circular(20),
                  //             child: Image.file(conttt.image,width:w/2.5,height:w/2.5,fit:BoxFit.cover))),
                  //         Positioned(
                  //           bottom: 8,
                  //           right: 8,
                  //           child:ClipRRect(
                  //             borderRadius: BorderRadius.circular(12),
                  //             child: Container(
                  //               width: 36,
                  //               height:36,
                                
                  //               child: TextButton(onPressed:control.updload,
                  //               style:TextButton.styleFrom(backgroundColor:colorbutton,foregroundColor: Colors.white),
                                                    
                  //               child: Icon(Icons.draw_outlined,size:21,),),
                  //             ),
                  //           )
                  //           )
                  //       ],
                  //      ),
                       
               
                  //    ],
                  //  ),

                    hieght(40),
                    Edittext(
                             enabel: false,
                      validator: (val) {
                        return valideInbut(val!,5,15,"username");
                      },
                      labele: "",
                      obescure: false,
                      hint: 'Enter your Username',
                       prifixicon:const Icon(Icons.person,size: 20,),
                      controller: control.username,
                    ),
                    hieght(20),
                    Edittext(
                             enabel: false,
                        validator: (val) {
                     return valideInbut(val!,5,50,"email");
                        },
                        obescure: false,
                        labele: "",
                        hint: 'Enter your Email',
                         prifixicon:const Icon(Icons.email,size: 20,),
                        controller: control.email),
          
                 hieght(20),
          
                  Edittext(
                           enabel: false,
                          validator: (val) {
                          return valideInbut(val!,10,50,"phone");
                          },
                          maxlent:10,
                          labele: "",
                          type:"phone",
                          obescure: false,
                             prifixicon:const Icon(Icons.phone,size: 20,),
                          hint: 'Phone',
                         
                          controller: control.phone),
                  
                    hieght(20),
                    GetBuilder<SingUpController>(builder: (controllere) {
                      return Edittext(
                               enabel: false,
                          validator: (val) {
                     return valideInbut(val!,10,15,"password");
                          },
                          obescure: controllere.obs,
                          labele: "",
                          hint: 'Enter your password',
                           prifixicon:const Icon(Icons.lock,size: 20,),
                          icon: IconButton(
                            icon: controller.icon,
                            onPressed: () {
                              conttt.echangeObsucr();
                            },
                          ),
                          controller: control.password);
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
          ):Center(child:Lottie.network("https://assets4.lottiefiles.com/private_files/lf30_dqbik4tt.json",width:140))
          );
        }
      )
    );
  }
}
