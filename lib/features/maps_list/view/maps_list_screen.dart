import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:csgo_grenades/features/maps_list/bloc/maps_list_bloc.dart';
import 'package:csgo_grenades/repositories/maps/maps_grenades.dart';
import 'package:get_it/get_it.dart';
import '../../../theme/app_colors.dart';
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
            return LayoutBuilder(
              builder: (context, constraints) {
                return ListView.builder(
                  itemCount: state.mapsList.length,
                  itemBuilder: (context, index) {
                    final map = state.mapsList[index];
                    return GestureDetector(
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
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: constraints.maxWidth * 0.4,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor,
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
                              AppColors.yellowColor,
                              AppColors.whiteColor,
                              AppColors.yellowColor,
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
                    );
                  },
                );
              },
            );
          }
          if (state is MapListLoadingFailed) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Упс... :('),
                  const Text('Что-то не так'),
                  const SizedBox(height: 30),
                  CupertinoButton(
                    color: Colors.amber,
                    onPressed: () {
                      _mapListBloc.add(LoadMapsList());
                    },
                    child: const Text('Перезагрузить',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
