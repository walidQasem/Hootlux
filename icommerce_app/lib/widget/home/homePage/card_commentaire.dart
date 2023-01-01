import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/shared/hieght.dart';
import 'package:widget/shared/isBlack.dart';
import 'package:widget/shared/text.dart';

import '../../../model/Hotel/Model_commentaire.dart';

class Card_Commentaire extends StatelessWidget {
  const Card_Commentaire({super.key, required this.model});
  final Commentaire_Model model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          Container(
          height: 100,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 70, 70, 70),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                  child:Text(model.udUser.toString()),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
                          fit: BoxFit.cover,
                        ))),
                wid(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                        model.usernameUser.toString(),
                        isblack(Colors.white, Colors.black),
                        14.5,
                        FontWeight.bold),
                    text(
                        model.dateCommentaire.toString(),
                        isblack(const Color.fromARGB(255, 222, 222, 222),
                            const Color.fromARGB(255, 129, 129, 129)),
                        12,
                        FontWeight.w100),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 68),
            child: ReadMoreText(
              model.textCommentaire.toString(),
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "cairo",
                  fontWeight: FontWeight.w500,
                  color: isblack(const Color.fromARGB(255, 255, 255, 255),
                      const Color.fromARGB(255, 114, 114, 114))),
              trimLines: 2,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: colorbutton),
              lessStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: colorbutton),
            ),
          ),
        ]),
      ),
    );
  }
}
