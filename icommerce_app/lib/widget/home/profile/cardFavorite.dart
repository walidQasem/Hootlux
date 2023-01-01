import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/FavoriteController.dart';
import 'package:widget/shared/hieght.dart';

import '../../../controller/home/hotel/GetFavController.dart';
import '../../../model/Hotel/Hotel_Model.dart';
import '../../../shared/isBlack.dart';
import '../../../view/home/homepage/details.dart';

class CardFavorite extends GetView<FavoriteController> {
  final Data_Class_Hotel dataHotel;
  const CardFavorite({
    super.key,
    required this.dataHotel,
  });
  @override
  Widget build(BuildContext context) {
    AfichageFavoriteControllere cc = Get.put(AfichageFavoriteControllere());
    return InkWell(
      onTap: () {
        Get.to(() => const DetailsHotel(),
            arguments: {
              "id": dataHotel.idHotel.toString(),
              "description": dataHotel.descriptionHotel,
              "rating": dataHotel.rating,
              "img": dataHotel.imgHotel.toString(),
              "price": dataHotel.price.toString(),
            },
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 500));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                SizedBox(
                  width: 130,
                  height: 130,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        dataHotel.imgHotel.toString(),
                        width: 120,
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          maxLines: 2,
                          dataHotel.nomHotel.toString(),
                          style: const TextStyle(
                              fontFamily: "cairo",
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      hieght(5),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: isblack(
                                const Color.fromARGB(255, 189, 189, 189),
                                const Color.fromARGB(255, 140, 140, 140)),
                            size: 20,
                          ),
                          Text(
                            'safi',
                            style: TextStyle(
                                color: isblack(
                                    const Color.fromARGB(255, 189, 189, 189),
                                    const Color.fromARGB(255, 149, 149, 149))),
                          ),
                          wid(12),
                          const Icon(
                            Icons.star_rate_rounded,
                            color: Color.fromARGB(255, 255, 191, 0),
                            size: 20,
                          ),
                          Text(
                            '4.6',
                            style: TextStyle(
                                color: isblack(
                                    const Color.fromARGB(255, 189, 189, 189),
                                    const Color.fromARGB(255, 149, 149, 149))),
                          ),
                        ],
                      ),
                      hieght(10),
                      Row(
                        children: [
                          Text('\$${dataHotel.price.toString()}',
                              style: TextStyle(color: colorOrange)),
                          Text('/Night',
                              style: TextStyle(
                                  color: isblack(
                                      const Color.fromARGB(255, 189, 189, 189),
                                      const Color.fromARGB(
                                          255, 139, 139, 139))))
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Positioned(
                right: 10,
                top: 50,
                child: IconButton(
                    onPressed: () {
                      Get.bottomSheet(Container(
                        padding: const EdgeInsets.all(10),
                        width: 500,
                        height: 320,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          color: isblack(const Color.fromARGB(255, 75, 75, 75),
                              Colors.white),
                        ),
                        child: Column(
                          children: [
                            hieght(5),
                            Container(
                              width: 70,
                              height: 5,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 184, 184, 184),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            hieght(10),
                            const Text(
                              "Remove From Favorite?",
                              style: TextStyle(
                                  fontFamily: "cairo",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            CardFavorite(
                                dataHotel: Data_Class_Hotel(
                                    idHotel: dataHotel.idHotel,
                                    imgHotel: dataHotel.imgHotel,
                                    nomHotel: dataHotel.nomHotel)),
                            hieght(10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: MaterialButton(
                                        color: const Color.fromARGB(
                                            255, 139, 139, 139),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text("Cancele",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                  wid(10),
                                  SizedBox(
                                    width: 150,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: MaterialButton(
                                        color: colorbutton,
                                        onPressed: () {
                                          controller.del_Fav(
                                              dataHotel.idHotel.toString());
                                          cc.deleteFavInLitst(
                                              dataHotel.idHotel!.toInt());
                                          Get.back();
                                        },
                                        child: const Text(
                                          "Yes Remove",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                    },
                    // controller.del_Fav(dataHotel.idHotel.toString());
                    icon: Icon(
                      Icons.do_not_disturb_on_total_silence_outlined,
                      color: colorOrange,
                      size: 30,
                    )))
          ],
        ),
      ),
    );
  }
}
