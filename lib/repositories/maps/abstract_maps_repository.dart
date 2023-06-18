import 'models/map_data.dart';

abstract class AbstractMapsRepository{
  Future<List<MapData>> loadMapData();

}