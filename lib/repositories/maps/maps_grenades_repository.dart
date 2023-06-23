import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/abstract_maps_repository.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/models/map_data.dart';

import 'models/map_grenades_data.dart';

class MapsGrenadesRepository implements AbstractMapsRepository{
  @override
  Future<List<MapData>> loadMapData() async {
    String jsonString = await rootBundle.loadString('lib/assets/maps.json');
    // debugPrint(jsonString.toString());
    List<dynamic> jsonList = json.decode(jsonString);
    List<MapData> mapDataList = jsonList.map((jsonObject) {
      return MapData(
        mapImage: Image.asset(jsonObject['mapImage']),
        mapLogo: Image.asset(jsonObject['mapLogo']),
        mapId: jsonObject['mapId'],
        title: jsonObject['title'],
      );
    }).toList();
    return mapDataList;
  }

  @override
  Future<List<GrenadeData>> loadGrenadesData(String mapId) async {
    String jsonString = await rootBundle.loadString('lib/assets/grenades.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    List<dynamic> maps = jsonData['maps'] as List<dynamic>;
    final mapData = maps.firstWhere((map) => map['mapId'] == mapId, orElse: () => null);
    if (mapData == null) {
      return [];
    }
    List<dynamic> grenades = mapData['grenades'] as List<dynamic>;
    List<GrenadeData> grenadesDataList = grenades.map((grenade) {
      List<dynamic> offsets = grenade['offsets'] as List<dynamic>;
      List<GrenadeOffset> grenadeOffsets = offsets.map((offset) {
        return GrenadeOffset(
          offsetX: offset['offsetX'],
          offsetY: offset['offsetY'],
          videoUrl: offset['videoUrl'],
        );
      }).toList();

      return GrenadeData(
        name: grenade['name'],
        offsets: grenadeOffsets,
      );
    }).toList();
    return grenadesDataList;
  }

}

