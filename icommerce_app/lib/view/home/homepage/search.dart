import 'package:flutter/material.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/shared/appBar.dart';

import '../../../shared/textFild.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbarfunction("Search"),
      body:ListView(children: [
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Edittext(

            validator: (val) {
              return null;
            },
            labele: "",
            obescure: false,
  
            icon: Icon(
              Icons.filter_list,
              
              color: colorOrange,
            ),
            hint: 'Search',
            prifixicon: const Icon(
              Icons.search,
            ),
          ),
        ),
      ]),
    );
  }
}