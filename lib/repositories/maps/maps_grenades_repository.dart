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




}
