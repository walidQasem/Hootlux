import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/home/hotel/Gallery.dart';
import 'package:widget/shared/appBar.dart';
import 'package:photo_view/photo_view.dart';

class Gallry extends StatelessWidget {
  const Gallry({super.key});

  @override
  Widget build(BuildContext context) {
    GallryController g = Get.put(GallryController());
    return Scaffold(
      appBar: appbarfunction("Gallry"),
      body: GetBuilder<GallryController>(builder: (cont) {
        return GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(cont.images.length, (index) {
            return Center(
                child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(
                      appBar: AppBar(backgroundColor: Colors.black,foregroundColor: Colors.white,),
                      body: PhotoView(

                        imageProvider: NetworkImage(
                          
                          cont.images[index]['url_image'].toString(),
                          
                       scale: 300
                        ),
                      ));
                }));
              },
              child: SizedBox(
                width: 170,
                height: 170,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      cont.images[index]['url_image'].toString(),
                      fit: BoxFit.cover,
                    )),
              ),
            ));
          }),
        );
      }),
    );
  }
}
