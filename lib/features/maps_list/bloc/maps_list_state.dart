part of 'maps_list_bloc.dart';

class MapListState {

}

class MapsListInitial extends MapListState{

}

class MapListLoading extends MapListState{

}

class MapListLoaded extends MapListState{
   MapListLoaded({required this.mapsList});

   final List<MapData> mapsList;
}