import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/models/map_data.dart';

abstract class MapDataBase {
  final String title;
  final Image mapLogo;
  final String mapId;
  final Image mapImage;

  const MapDataBase({
    required this.title,
    required this.mapLogo,
    required this.mapId,
    required this.mapImage,
  });
}

class MapData extends MapDataBase {
  const MapData({
    required String title,
    required Image mapLogo,
    required String mapId,
    required Image mapImage,
  }) : super(
    title: title,
    mapLogo: mapLogo,
    mapId: mapId,
    mapImage: mapImage,
  );
}

class MapGrenadesData extends MapDataBase {
  final Image mapGrenades;

  const MapGrenadesData({
    required this.mapGrenades,
    required String title,
    required Image mapLogo,
    required String mapId,
    required Image mapImage,
  }) : super(
    title: title,
    mapLogo: mapLogo,
    mapId: mapId,
    mapImage: mapImage,
  );
}

class Grenade {
  final String name;
  final List<GrenadeOffset> offsets;

  Grenade({
    required this.name,
    required this.offsets,
  });
}

class GrenadeOffset {
  final Offset offset;
  final String videoUrl;

  GrenadeOffset({
    required this.offset,
    required this.videoUrl,
  });
}
