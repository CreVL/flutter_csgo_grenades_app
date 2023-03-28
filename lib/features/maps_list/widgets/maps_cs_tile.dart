import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/models/maps_cs.dart';

class MapsCsTile extends StatelessWidget {
  const MapsCsTile({super.key, required this.mapsCs});

  final MapsCs mapsCs;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: Colors.red,));
  }
}
