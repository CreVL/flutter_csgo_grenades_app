import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/features/video_ilst/video.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/models/map_data.dart';
import 'package:get_it/get_it.dart';
import 'package:photo_view/photo_view.dart';

import '../../../repositories/maps/abstract_maps_repository.dart';
import '../../../repositories/maps/models/map_grenades_data.dart';
import '../../maps_list/widgets/maps_cs_tile.dart';

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

  @override
  void initState() {
    super.initState();
    loadGrenadesData();
  }

  Future<void> loadGrenadesData() async {
    _grenades = await GetIt.I<AbstractMapsRepository>().loadGrenadesData(widget.mapId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: [
          PhotoView(
            scaleStateController: PhotoViewScaleStateController(),
            enableRotation: false,
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.contained,
            imageProvider: widget.mapImage.image,
          ),
          if (_grenades.isEmpty)
            Center(child: CircularProgressIndicator()),
          if (showSmoke && _grenades.isNotEmpty)
            Stack(
              children: _grenades
                  .firstWhere((g) => g.name == 'Smoke')
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
                            offset: Offset(offset.offsetX, offset.offsetY),
                          ),
                        ),
                      );
                    },
                    child: Transform.scale(
                      scale: 0.08,
                      child: Image.asset('lib/assets/grenade_icon/smoke_icon.png'),
                    ),
                  ),
                );
              }).toList(),
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
                            offset: Offset(offset.offsetX, offset.offsetY),
                          ),
                        ),
                      );
                    },
                    child: Transform.scale(
                      scale: 0.08,
                      child: Image.asset('lib/assets/grenade_icon/flash_icon.png'),
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
                            offset: Offset(offset.offsetX, offset.offsetY),
                          ),
                        ),
                      );
                    },
                    child: Transform.scale(
                      scale: 0.08,
                      child: Image.asset('lib/assets/grenade_icon/fire_icon.png'),
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showSmoke = !showSmoke;
                  });
                },
                child: Text('Smoke'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showFlash = !showFlash;
                  });
                },
                child: Text('Flash'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showMolotov = !showMolotov;
                  });
                },
                child: Text('Molotov'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

