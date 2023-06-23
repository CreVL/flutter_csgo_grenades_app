import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/abstract_maps_repository.dart';

import '../../../repositories/maps/models/models.dart';

part 'maps_list_event.dart';
part 'maps_list_state.dart';

class MapsListBloc extends Bloc<MapsListEvent, MapListState> {
  MapsListBloc(this.mapsRepository) : super(MapsListInitial()) {
    on<LoadMapsList>((event, emit) async {

      try{
        final mapsList = await mapsRepository.loadMapData();
        emit(MapListLoaded(mapsList:mapsList));
      }catch (error){
        emit(MapListLoadingFailed(exception:  error));
      }
    });
  }
  final AbstractMapsRepository mapsRepository;
}