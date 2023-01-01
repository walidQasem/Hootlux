import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:widget/constant/color.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(32.3101, -9.2366),
                zoom: 14.2,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}',
                    subdomains: ["a", "b", "c"]),
                MarkerLayerOptions(markers: [
                  Marker(
                      point: latLng.LatLng(32.3101, -9.2366),
                      builder: (xx) => Icon(
                            Icons.location_on,
                            color: colorbutton,
                            size: 40,
                          ))
                ])
              ],
            ),
          ),
        ),
      ],
    );
  }
}
