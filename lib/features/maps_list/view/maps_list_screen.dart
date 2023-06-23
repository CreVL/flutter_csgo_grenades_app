import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_csgo_grenades_app/features/maps_list/bloc/maps_list_bloc.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/maps_grenades.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/maps/models/models.dart';
import '../../maps_grenades/view/view.dart';

class MapsListScreen extends StatefulWidget {
  const MapsListScreen({Key? key}) : super(key: key);

  @override
  State<MapsListScreen> createState() => _MapsListScreenState();
}

class _MapsListScreenState extends State<MapsListScreen> {
  final _mapListBloc = MapsListBloc(GetIt.I<AbstractMapsRepository>());

  @override
  void initState() {
    super.initState();
    _mapListBloc.add(LoadMapsList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maps'),
      ),
      body: BlocBuilder<MapsListBloc, MapListState>(
        bloc: _mapListBloc,
        builder: (context, state) {
          if (state is MapListLoaded) {
            return Column(
              children: List.generate(state.mapsList.length, (index) {
                final map = state.mapsList[index];
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MapsGrenadesScreen(
                            title: map.title,
                            mapImage: map.mapImage,
                            mapId: map.mapId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFD100),
                            Color(0xFFFFFFFF),
                            Color(0xFFFFD100),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: map.mapLogo.image,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
