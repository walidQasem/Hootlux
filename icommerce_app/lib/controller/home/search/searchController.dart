import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/home/HomeController.dart';
import 'package:widget/model/Hotel/Hotel_Model.dart';

class SearcheCotroller extends GetxController {
  HomeController ho = Get.put(HomeController());
  late TextEditingController searchInput;

  late String vale = "";
  late List dataHotel = [];
  late Map<String, dynamic> ff = {};
  late RangeValues values;
  late List namHotel = [];
  late List<Data_Class_Hotel> listeModel = [];
  late List<Data_Class_Hotel> filter = [];
  late int filterResult = 0;
  late bool isRestor = false;
  late List ffe = [];
  onchageRange(RangeValues d) {
    values = d;
    update();
  }

  chnageVale(String v) {
    vale = v;

    update();
  }

  getHotel() {
    // dataHotel.addAll(ho.data.toList());
    for (int i = 0; i < ho.data.length; i++) {
      listeModel.addAll([Data_Class_Hotel.fromJson(ho.data[i])]);
    }
    dataHotel.addAll(listeModel);
    filterResult = dataHotel.length;
    filter = List.from(listeModel);
  }

  search(String value) {
    if (searchInput.text.isNotEmpty) {
      dataHotel = [];
      dataHotel = filter 
          .where((element) =>
              element.nomHotel!.toLowerCase().contains(value.toLowerCase()) ||
              element.villeHotel!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      filterResult = dataHotel.length;
    } else {
      dataHotel = [];
      dataHotel.addAll(listeModel);
      filterResult = dataHotel.length;
    }
    update();
  }

  filterSearch() {
    dataHotel = [];
    dataHotel = filter
        .where((element) =>
            element.price! <= values.end.toInt() &&
            element.price! >= values.start.toInt())
        .toList();
    filterResult = dataHotel.length;
    isRestor = false;
    update();
  }

  restoreFilter() {
    if (isRestor == false) {
      dataHotel = [];
      dataHotel.addAll(listeModel);
      filterResult = dataHotel.length;
      values = const RangeValues(50, 1000);
      isRestor = true;
    }
    update();
  }

// da.where((element) => element.contains(query)).toList();
  @override
  void onInit() {
    values = const RangeValues(50, 1000);
    getHotel();
    searchInput = TextEditingController();
    super.onInit();
  }
}

































//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: IconButton(
//             onPressed: () {
//               query = "";
//             },
//             icon: const Icon(Icons.close)),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Get.back();
//         },
//         icon: const Icon(Icons.arrow_back_rounded));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     for (int i = 0; i < ho.data.length; i++) {
//       if (query == ho.data[i]['nom_Hotel']) {
//         return SizedBox(
//             height: 160,
//             child: InkWell(
//                 onTap: () {},
//                 child: CardSearchHotel(
//                     dataHotel: Data_Class_Hotel.fromJson(ho.data[i]))));
//       }
//     }
//     return Text(query);
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List da = [];
//     List listeHotel = [];
//     for (int i = 0; i < ho.data.length; i++) {
//       listeHotel.addAll([ho.data[i]]);
//     }
  
//     listeHotel.sort((b, a) => a['price'].compareTo(b['price']));
    
//     for (int i = 0; i < ho.data.length; i++) {
//       da.addAll(["${ho.data[i]['nom_Hotel']}"]);
//     }
//     List res = da.where((element) => element.contains(query)).toList();
//     return ListView.builder(
//         itemCount: query == "" ? ho.data.length : res.length,
//         itemBuilder: (contex, i) {
//           return InkWell(
//             onTap: () {
//               query = query == ""
//                   ? ho.data[i]['nom_Hotel'].toString()
//                   : res[i].toString();
//               showResults(context);
//             },
//             child: Container(
//               child: query == ""
//                   ? Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: CardSearchHotel(
//                           dataHotel: Data_Class_Hotel.fromJson(listeHotel[i])),
//                     )
//                   : Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("${res[i]}"),
//                     ),
//             ),
//           );
//         });
//   }
// }
