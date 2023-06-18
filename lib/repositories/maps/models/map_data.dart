import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'map_grenades_data.dart';

abstract class MapDataBase extends Equatable {
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

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

