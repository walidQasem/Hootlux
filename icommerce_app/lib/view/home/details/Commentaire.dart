import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/detailsController.dart';
import 'package:widget/model/Hotel/Model_commentaire.dart';
import 'package:widget/shared/button.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';

import '../../../function/validInput.dart';
import '../../../shared/textFild.dart';
import '../../../widget/home/homePage/card_commentaire.dart';

class Commentaire extends StatelessWidget {
    final player = AudioPlayer();
   Commentaire({super.key});


  @override
  Widget build(BuildContext context) {
    DetailsController c = Get.put(DetailsController());
    return Column(
      children: [
        hieght(5),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ButtonFun(
              "add comment",
              isblack(const Color.fromARGB(255, 84, 84, 84),
                  const Color.fromARGB(255, 223, 223, 223)),
              double.infinity,
              50, () {
            Get.bottomSheet(
              
              
              Container(
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: isblack(const Color.fromARGB(255, 51, 51, 51),
                      const Color.fromARGB(255, 255, 255, 255))),
              child: Column(
                children: [
                  hieght(10),
                   Container(
                              width: 70,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 184, 184, 184),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Stack(
                        children: [
                          Edittext(
                            
                            validator: (val) {
                              return null;
                            },
                            icon: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: () async {
                                 Get.back();
                                await c.addCommantaire();
                                player.play(AssetSource('comment.mp3'));
                               
                              },
                            ),
                            ff: c.focus,
                            labele: "",
                            obescure: false,
                            hint: 'Comment',
                            hightInput: 30,
                            controller: c.coment,
                            prifixicon: const Icon(Icons.comment),
                          ),
                        ],
                      )),
                ],
              ),
            ));
          },
              isblack(const Color.fromARGB(255, 204, 204, 204),
                  const Color.fromARGB(255, 77, 77, 77)),
              Icon(
                Icons.add_comment_rounded,
                color: isblack(const Color.fromARGB(255, 204, 204, 204),
                    const Color.fromARGB(255, 77, 77, 77)),
              )),
        ),
        GetBuilder<DetailsController>(builder: (con) {
          return Column(
            children: [
              ...List.generate(con.commntaire.length, (index) {
                return Card_Commentaire(
                  model: Commentaire_Model.fromJson(con.commntaire[index]),
                );
              })
            ],
          );
        }),
      ],
    );
  }
}
