part of 'map_grenades_bloc.dart';

class MapGrenadesState {

}

class MapGrenadesInitial extends MapGrenadesState {

}

class MapGrenadesLoading extends MapGrenadesState{

}

class MapGrenadesLoadingFailed extends MapGrenadesState{
  MapGrenadesLoadingFailed({this.exception});

  final Object? exception;
}


class MapGrenadesLoaded extends MapGrenadesState{
  final List<GrenadeData> grenadesList;

  MapGrenadesLoaded({required this.grenadesList});
}