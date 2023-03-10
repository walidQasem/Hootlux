import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/controller/home/HomeController.dart';
import 'package:widget/view/home/homepage/searchPage.dart';

import '../../../shared/textFild.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController g = Get.put(HomeController());
    return Edittext(
      onTap: () {
    
        Get.to(const SearchPage());
      },
      validator: (val) {
        return null;
      },
      labele: "",
      obescure: false,
      enabel: true,
      icon: Icon(
        Icons.filter_list,
        color: colorOrange,
      ),
      hint: 'Search',
      prifixicon: const Icon(
        Icons.search,
      ),
    );
  }
}
