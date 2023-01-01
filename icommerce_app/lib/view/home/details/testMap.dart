// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:widget/shared/appBar.dart';
// import 'package:widget/shared/hieght.dart';
// import 'package:latlong2/latlong.dart' as latLng;
// import 'package:flutter_map/flutter_map.dart';

// class TestMap extends StatelessWidget {
//   const TestMap({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: appbarfunction("Test map"),

//       body: ListView(
//         children: [
//           SizedBox(width: 100,
//           height: 200,
          
//             child: FlutterMap(
//     options: MapOptions(
//               center:latLng.LatLng(32.3101, -9.2366),
//               zoom: 15.2,
//     ),
//     nonRotatedChildren: [
//               AttributionWidget.defaultWidget(
//                   source: 'OpenStreetMap contributors',
//                   onSourceTapped: null,
//               ),
//     ],
//     children: [
//               TileLayer(
//                   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                   userAgentPackageName: 'com.example.app',
//               ),
//     ],
// ),
//           ),
//         ],
//       ),
//     );
//   }
// }
