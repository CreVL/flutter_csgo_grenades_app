import 'package:flutter_bloc/flutter_bloc.dart';

part 'maps_list_event.dart';
part 'maps_list_state.dart';

class MapsListBloc extends Bloc<MapsListEvent, MapsListState> {
  MapsListBloc() : super(MapsListInitial()) {
    on<MapsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}