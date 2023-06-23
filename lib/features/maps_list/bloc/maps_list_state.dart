part of 'maps_list_bloc.dart';

class MapListState {

}

class MapsListInitial extends MapListState{

}

class MapListLoading extends MapListState{

}

class MapListLoadingFailed extends MapListState {
   MapListLoadingFailed({this.exception});

   final Object? exception;
}

class MapListLoaded extends MapListState{
   MapListLoaded({required this.mapsList});

   final List<MapData> mapsList;
}

