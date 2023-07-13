import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/maps/abstract_maps_repository.dart';
import '../../../repositories/maps/models/map_grenades_data.dart';

part 'map_grenades_event.dart';
part 'map_grenades_state.dart';

class MapGrenadesBloc extends Bloc<MapGrenadesEvent, MapGrenadesState> {
  final AbstractMapsRepository grenadesRepository;
  final String mapId;

  MapGrenadesBloc(this.grenadesRepository, this.mapId) : super(MapGrenadesInitial()) {
    on<LoadMapGrenades>((event, emit) async {
      try{
        final grenadesList = await grenadesRepository.loadGrenadesData(mapId);
        emit(MapGrenadesLoaded(grenadesList:grenadesList));
      }catch (error){
        emit(MapGrenadesLoadingFailed(exception:  error));
      }
    });
  }
}
