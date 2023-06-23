import 'models/map_data.dart';
import 'models/map_grenades_data.dart';

abstract class AbstractMapsRepository {
  Future<List<MapData>> loadMapData();
  Future<List<GrenadeData>> loadGrenadesData(String mapId);
}
