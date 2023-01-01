import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/profil/EditprofileController.dart';
import 'package:widget/main.dart';
import 'package:widget/widget/auth/buttomAuth.dart';

import '../../../function/validInput.dart';
import '../../../shared/appBar.dart';
import '../../../shared/hieght.dart';
import '../../../shared/textFild.dart';
import '../../../widget/home/profile/inkwil.dart';

class EditeProfile extends GetView<EditProfilController> {
  const EditeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfilController controllere = Get.put(EditProfilController());
      double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appbarfunction("Edit Profile"),
        body: SingleChildScrollView(
          child: Form(
            key: controller.forme,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(255, 233, 233, 233),
                        ),
                        child: ClipRRect(
                             borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            "https://images.unsplash.com/photo-1593359863503-f598684c806f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ClipOval(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: colorbutton),
                                onPressed: () {},
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                        hieght(50),
                                Edittext(
                    validator: (val) {
                      return valideInbut(val!, 5, 18, "username");
                    },
                    labele: "",
                    obescure: false,
                 enabel: false,
                    hint: 'Enter your username',
                    icon:const Icon(Icons.edit_outlined),
                   
                    prifixicon: Icon(Icons.person,color:colorbutton,size:20),
                    controller: controllere.username),
                      hieght(20),
                Edittext(
                    validator: (val) {
                      return valideInbut(val!, 5, 18, "email");
                    },
                    enabel: true,
                    labele: "",
                    obescure: false,
                    hint: 'Enter your Email',
                  
             
                    prifixicon:  Icon(Icons.email,color:colorbutton,size:20,),
                    controller: controllere.email),
                  
           hieght(20),

             Edittext(
                    validator: (val) {
                      return valideInbut(val!, 5, 18, "phone");
                    },
                    labele: "",
                    obescure: false,
                enabel: false,
                    hint: 'Enter your phone',
                    type:"phone",
                    icon: const Icon(Icons.edit_outlined),
                   
                    prifixicon: Icon(Icons.phone,color:colorbutton,size:20,),
                    controller: controllere.phone),
        
        
        
                      hieght(30),
        
        


                Container(
              
                  height:55,
                  width:w ,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: ElevatedButton.icon(
                      style:TextButton.styleFrom(backgroundColor: colorbutton),
                      onPressed: () {
                        controller.save();
                        },
                        icon: const Icon(
                         Icons.save_as_outlined,
                         size: 24.0,
                         ),
                    label: const Text('Save',style:TextStyle(fontWeight: FontWeight.bold,fontSize:16,fontFamily: "cairo"),), // <-- Text
                                  ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
