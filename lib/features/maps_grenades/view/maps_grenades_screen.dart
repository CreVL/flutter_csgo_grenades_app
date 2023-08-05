import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_csgo_grenades_app/features/video_ilst/video.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/maps/abstract_maps_repository.dart';
import '../../../repositories/maps/models/map_grenades_data.dart';
import '../bloc/map_grenades_bloc.dart';
import '../widgets/grenade_button.dart';

class MapsGrenadesScreen extends StatefulWidget {
  const MapsGrenadesScreen({
    Key? key,
    required this.title,
    required this.mapImage,
    required this.mapId,
  }) : super(key: key);

  final String title;
  final Image mapImage;
  final String mapId;

  @override
  State<MapsGrenadesScreen> createState() => _MapsGrenadesScreenState();
}

class _MapsGrenadesScreenState extends State<MapsGrenadesScreen> {
  bool showSmoke = false;
  bool showFlash = false;
  bool showMolotov = false;
  List<GrenadeData> _grenades = [];
  late MapGrenadesBloc _mapGrenadesBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mapGrenadesBloc =
        MapGrenadesBloc(GetIt.I<AbstractMapsRepository>(), widget.mapId);
    _mapGrenadesBloc.add(LoadMapGrenades());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocBuilder<MapGrenadesBloc, MapGrenadesState>(
        bloc: _mapGrenadesBloc,
        builder: (context, state) {
          if (state is MapGrenadesLoaded) {
            _grenades = state.grenadesList;
            return InteractiveViewer(
                boundaryMargin: EdgeInsets.all(40),
                minScale: 0.5,
                maxScale: 150.0,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          color: Colors.black,
                          child: widget.mapImage,
                        ),
                        if (showSmoke && _grenades.isNotEmpty)
                          Positioned.fill(
                            child: Stack(
                              children: _grenades
                                  .firstWhere((g) => g.name == 'Smoke')
                                  .offsets
                                  .map((GrenadeOffset offset) {
                                return Positioned.fill(
                                  left: offset.offsetX,
                                  top: offset.offsetY,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VideoScreen(
                                            videoUrl: offset.videoUrl,
                                            offset: Offset(
                                                offset.offsetX, offset.offsetY),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Transform.scale(
                                      scale: 0.05,
                                      child: Image.asset(
                                          'lib/assets/grenade_icon/smoke_icon.png'),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        if (showFlash && _grenades.isNotEmpty)
                          Stack(
                            children: _grenades
                                .firstWhere((g) => g.name == 'Flash')
                                .offsets
                                .map((offset) {
                              return Positioned(
                                left: offset.offsetX,
                                top: offset.offsetY,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoScreen(
                                          videoUrl: offset.videoUrl,
                                          offset: Offset(
                                              offset.offsetX, offset.offsetY),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Transform.scale(
                                    scale: 0.03,
                                    child: Image.asset(
                                        'lib/assets/grenade_icon/flash_icon.png'),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        if (showMolotov && _grenades.isNotEmpty)
                          Stack(
                            children: _grenades
                                .firstWhere((g) => g.name == 'Molotov')
                                .offsets
                                .map((offset) {
                              return Positioned(
                                left: offset.offsetX,
                                top: offset.offsetY,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VideoScreen(
                                          videoUrl: offset.videoUrl,
                                          offset: Offset(
                                              offset.offsetX, offset.offsetY),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Transform.scale(
                                    scale: 0.03,
                                    child: Image.asset(
                                        'lib/assets/grenade_icon/fire_icon.png'),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                ));
          }
          if (state is MapGrenadesLoading) {
            return Stack(
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
          if (state is MapGrenadesLoadingFailed) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Упс... :('),
                  Text('Не удалось загрузить координаты гранат.'),
                  const SizedBox(height: 30),
                  CupertinoButton(
                    child: const Text('Повторить',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    color: Colors.amber,
                    onPressed: () {
                      _mapGrenadesBloc.add(LoadMapGrenades());
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: buildBottomNavigationBar(
        showSmoke: showSmoke,
        showFlash: showFlash,
        showMolotov: showMolotov,
        onSmokePressed: () {
          setState(() {
            showSmoke = !showSmoke;
          });
        },
        onFlashPressed: () {
          setState(() {
            showFlash = !showFlash;
          });
        },
        onMolotovPressed: () {
          setState(() {
            showMolotov = !showMolotov;
          });
        },
      ),
    );
  }
}
