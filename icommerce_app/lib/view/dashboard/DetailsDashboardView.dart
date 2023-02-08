import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget/controller/dashboard/detailsDashboardController.dart';
import 'package:widget/shared/appBar.dart';

class DetailsDashbooradView extends StatelessWidget {
  const DetailsDashbooradView({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsControllerDashBoroad ff = Get.put(DetailsControllerDashBoroad());
    return Scaffold(
      appBar: appbarfunction("Details"),
      body: Text(ff.id.toString()),
    );
  }
}
