import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:widget/class/staturequest.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/hotel/addHotelController.dart';
import 'package:widget/shared/appBar.dart';
import 'package:widget/shared/hieght.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:widget/shared/isBlack.dart';
import 'package:widget/shared/textFild.dart';

import '../../../function/validInput.dart';
import '../../../shared/button.dart';
import '../../../shared/text.dart';
import 'package:chips_choice/chips_choice.dart';

class AddHotel extends StatelessWidget {
  const AddHotel({super.key});

  @override
  Widget build(BuildContext context) {
    AddHotelController controller = Get.put(AddHotelController());

    return Scaffold(
        appBar: appbarfunction("Add Hotel"),
        body: Form(
          key: controller.form,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(children: [
                  Edittext(
                      validator: (val) {
                        return valideInbut(val!, 5, 18, "name");
                      },
                      labele: "",
                      obescure: false,
                      hint: 'Enter Name Hotel',
                      prifixicon: const Icon(Icons.hotel_outlined),
                      controller: controller.name_Hotel),
                  hieght(20),
                  Edittext(
                      validator: (val) {
                        return valideInbut(val!, 5, 18, "name");
                      },
                      labele: "",
                      obescure: false,
                      hint: 'Enter your Description',
                      prifixicon: const Icon(Icons.description_outlined),
                      controller: controller.desc_Hotel),
                  hieght(20),
                  Edittext(
                      validator: (val) {
                        return valideInbut(val!, 5, 18, "name");
                      },
                      labele: "",
                      obescure: false,
                      hint: 'Enter your Phone',
                      prifixicon: const Icon(Icons.phone_in_talk_outlined),
                      controller: controller.phone_Hotel),
                  hieght(20),
                  Edittext(
                      validator: (val) {
                        return valideInbut(val!, 5, 18, "email");
                      },
                      labele: "",
                      obescure: false,
                      hint: 'Enter your email',
                      prifixicon: const Icon(Icons.email_outlined),
                      controller: controller.email_Hotel),
                  hieght(20),
                  Edittext(
                      validator: (val) {
                        return valideInbut(val!, 5, 18, "name");
                      },
                      labele: "",
                      obescure: false,
                      hint: 'Enter price',
                      prifixicon: const Icon(Icons.price_change_outlined),
                      controller: controller.price_Hotel),
                  hieght(20),
                  Edittext(
                      validator: (val) {
                        return valideInbut(val!, 5, 18, "name");
                      },
                      labele: "",
                      obescure: false,
                      hint: 'Rating Hotel',
                      prifixicon: const Icon(Icons.star_outline_rounded),
                      controller: controller.rating_Hotel),
                  hieght(20),
                  GetBuilder<AddHotelController>(builder: (cont) {
                    if (cont.ss == StatusRequest.success) {
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: isblack(
                                const Color.fromARGB(255, 81, 81, 81),
                                const Color.fromARGB(255, 235, 235, 235)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            text(
                                "Facility",
                                isblack(Colors.white,
                                    const Color.fromARGB(255, 97, 97, 97)),
                                14,
                                FontWeight.bold),
                            ChipsChoice<String>.multiple(
                              choiceCheckmark: true,
                              wrapped: true,
                              choiceStyle: C2ChipStyle.filled(
                                  foregroundStyle:
                                      const TextStyle(fontFamily: "cairo"),
                                  elevation: 0,
                                  color: isblack(
                                      const Color.fromARGB(255, 118, 118, 118),
                                      const Color.fromARGB(255, 255, 255, 255)),
                                  selectedStyle: C2ChipStyle(
                                    foregroundStyle: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: "cairo",
                                        fontWeight: FontWeight.bold),
                                    backgroundColor: colorbutton,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  )),
                              alignment: WrapAlignment.start,
                              value: cont.tags,
                              onChanged: (val) {
                                cont.chnage(val);
                              },
                              choiceItems: C2Choice.listFrom<String, String>(
                                source: cont.option,
                                value: (i, v) => v,
                                label: (i, v) => v,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 55, 55, 55)),
                      );
                    }
                  }),
                  hieght(13),
                  GetBuilder<AddHotelController>(builder: (con) {
                    return Wrap(
                      children: [
                        ...List.generate(con.image.length, (i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                con.deleteImgaes(con.image[i], i);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: AnimatedOpacity(
                                      opacity: 0.6,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.file(
                                          con.image[i],
                                          fit: BoxFit.cover,
                                          width: 500,
                                          height: 500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                      left: 40,
                                      top: 30,
                                      child: Icon(
                                        Icons
                                            .do_not_disturb_on_total_silence_outlined,
                                        color: Color.fromARGB(255, 255, 87, 75),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                        InkWell(
                          onTap: () {
                            Get.bottomSheet(Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: isblack(
                                      const Color.fromARGB(255, 83, 83, 83),
                                      const Color.fromARGB(255, 233, 233, 233)),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.uploadCamera();
                                      },
                                      child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Column(children: [
                                          Icon(
                                            Icons.camera_alt_rounded,
                                            size: 50,
                                            color: isblack(
                                                Colors.white,
                                                const Color.fromARGB(
                                                    255, 90, 90, 90)),
                                          ),
                                          text(
                                              "Camera",
                                              isblack(
                                                  Colors.white,
                                                  const Color.fromARGB(
                                                      255, 90, 90, 90)),
                                              15,
                                              FontWeight.bold),
                                        ]),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.uploadGallry();
                                      },
                                      child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Column(children: [
                                          Icon(
                                            Icons.image_rounded,
                                            color: isblack(
                                                Colors.white,
                                                const Color.fromARGB(
                                                    255, 90, 90, 90)),
                                            size: 50,
                                          ),
                                          text(
                                              "Gallry",
                                              isblack(
                                                  Colors.white,
                                                  const Color.fromARGB(
                                                      255, 90, 90, 90)),
                                              15,
                                              FontWeight.bold),
                                        ]),
                                      ),
                                    )
                                  ]),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: double.infinity,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: isblack(
                                      const Color.fromARGB(255, 81, 81, 81),
                                      const Color.fromARGB(255, 233, 233, 233)),
                                  borderRadius: BorderRadius.circular(17)),
                              child: Icon(
                                Icons.backup_rounded,
                                size: 40,
                                color: isblack(
                                    const Color.fromARGB(255, 236, 236, 236),
                                    const Color.fromARGB(255, 155, 155, 155)),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
                  hieght(20),
                  GetBuilder<AddHotelController>(builder: (contexe) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      width: double.infinity,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FlutterMap(
                          options: MapOptions(
                            onTap: (x) {
                              contexe.getMap(x.latitude, x.longitude);
                              print(contexe.lalitude);
                            },
                            center: latLng.LatLng(
                                contexe.lalitude, contexe.longitude),
                            zoom: 7.2,
                          ),
                          layers: [
                            TileLayerOptions(
                                urlTemplate:
                                    'https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}',
                                subdomains: ["a", "b", "c"]),
                            MarkerLayerOptions(markers: [
                              Marker(
                                  point: latLng.LatLng(
                                      contexe.lalitude, contexe.longitude),
                                  builder: (xx) => Icon(
                                        Icons.location_on,
                                        color: colorbutton,
                                        size: 40,
                                      ))
                            ])
                          ],
                        ),
                      ),
                    );
                  }),
                  hieght(20),
                  GetBuilder<AddHotelController>(builder: (cont) {
                    return Container(
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: isblack(const Color.fromARGB(255, 65, 65, 65),
                              const Color.fromARGB(255, 234, 234, 234)),
                          borderRadius: BorderRadius.circular(11)),
                      width: double.infinity,
                      child: DropdownButton(
                        underline: const Text(""),
                        borderRadius: BorderRadius.circular(11),
                        dropdownColor: isblack(
                            const Color.fromARGB(255, 65, 65, 65),
                            const Color.fromARGB(255, 223, 223, 223)),
                        value: cont.ville,
                        items: cont.listVille
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: text(
                                      e.toString(),
                                      isblack(
                                          const Color.fromARGB(
                                              255, 233, 233, 233),
                                          const Color.fromARGB(
                                              255, 100, 100, 100)),
                                      15,
                                      FontWeight.bold),
                                )))
                            .toList(),
                        onChanged: (value) {
                          cont.onchange(value!);
                          print(cont.ville);
                        },
                      ),
                    );
                  }),
                  hieght(20),
                  ButtonFun("Add your hotel", colorbutton, double.infinity, 50,
                      () {
                    controller.upload();
                    controller.isvalide();
                  }, null, const Icon(Icons.add), null),
                ]),
              ),
            ],
          ),
        ));
  }
}
