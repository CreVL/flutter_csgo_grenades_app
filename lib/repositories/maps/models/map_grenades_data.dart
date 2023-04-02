import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/models/map_data.dart';

class MapGrenadesData extends MapData {
  final Image mapGrenades;

  const MapGrenadesData(
      {required this.mapGrenades,
      required super.title,
      required super.mapLogo,
      required super.mapId,
      required super.mapImage});
}


List<Offset> smokeOffsets = [
  Offset(-53, 212),
  Offset(115, -40),
  Offset(-250, 20),
  Offset(10, -20),
  Offset(40, 60),
  Offset(-250, 20),
  Offset(115, -90),
  Offset(-250, 20),
  Offset(120, -20),
  Offset(140, 220),
];

List<Offset> flashOffsets = [
  Offset(-70, 15),
  Offset(130, 60),
  Offset(-20, 190),
  Offset(140, 90),
  Offset(-40, 100),
  Offset(100, 10),
  Offset(-110, 30),
  Offset(233, 80),
  Offset(-153, 20),
  Offset(143, 40),
];
List<Offset> molyOffsets = [
  Offset(70, -15),
  Offset(130, 60),
  Offset(20, -190),
  Offset(140, 90),
  Offset(-40, -100),
  Offset(100, -10),
  Offset(-110, -30),
  Offset(233, 80),
  Offset(-153, -20),
  Offset(143, -40),
];

class Grenade {
  final String name;
  final List<GrenadeOffset> offsets;
  Grenade({required this.name, required this.offsets});
}

class GrenadeOffset {
  final Offset offset;
  final String videoUrl;
  GrenadeOffset({required this.offset, required this.videoUrl});
}
