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
