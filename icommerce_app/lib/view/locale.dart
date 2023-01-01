import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/locale/localeController.dart';
import 'package:widget/main.dart';
import 'package:widget/view/onboarding.dart';

import '../shared/flageColumn.dart';
import '../widget/localeW/flageGrid.dart';
import '../widget/localeW/title.dart';

class LocaleService extends GetView<MylocalController> {
  const LocaleService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: const [
      Padding(
        padding: EdgeInsets.only(top: 60),
        child: Bartitle(),
      ),
      Expanded(child: FlageGrid()),
    ]));
  }
}
