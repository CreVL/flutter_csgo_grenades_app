import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/features/video_ilst/video.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/models/map_data.dart';
import 'package:photo_view/photo_view.dart';

import '../../../repositories/maps/models/map_grenades_data.dart';
import '../../maps_list/widgets/maps_cs_tile.dart';

class MapsGrenadesScreen extends StatefulWidget {
  const MapsGrenadesScreen(
      {Key? key, required this.title, required this.mapImage})
      : super(key: key);
  final String title;
  final Image mapImage;

  @override
  State<MapsGrenadesScreen> createState() => _MapsGrenadesScreenState();
}

class _MapsGrenadesScreenState extends State<MapsGrenadesScreen> {
  bool showSmoke = false;
  bool showFlash = false;
  bool showMolotov = false;
  final List<Grenade> grenades = [
    Grenade(
      name: 'Smoke',
      offsets: [
        GrenadeOffset(
          offset: const Offset(-83, 200),
          videoUrl: 'lib/assets/video/3smoke.mp4',
        ),
        GrenadeOffset(
          offset: const Offset(-65, 128),
          videoUrl: 'lib/assets/video/2smoke.mp4',
        ),
        GrenadeOffset(
          offset: const Offset(-45, 130),
          videoUrl: 'lib/assets/video/1smoke.mp4',
        ),
        // и т.д.
      ],
    ),
    Grenade(
      name: 'Flash',
      offsets: [
        GrenadeOffset(
          offset: Offset(10, 15),
          videoUrl: 'https://www.youtube.com/watch?v=r9KLDgdokvQ&t=10s',
        ),
        GrenadeOffset(
          offset: Offset(15, 110),
          videoUrl: 'https://www.youtube.com/watch?v=r9KLDgdokvQ&t=10s',
        ),
        // и т.д.
      ],
    ),
    Grenade(
      name: 'Molotov',
      offsets: [
        GrenadeOffset(
          offset: Offset(104, 55),
          videoUrl: 'https://www.youtube.com/watch?v=r9KLDgdokvQ&t=10s',
        ),
        GrenadeOffset(
          offset: Offset(-190, 10),
          videoUrl: 'https://www.youtube.com/watch?v=r9KLDgdokvQ&t=10s',
        ),
        // и т.д.
      ],
    ),
    // и т.д.
  ];

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
          if (showSmoke)
            Stack(
              children: grenades
                  .firstWhere((g) => g.name == 'Smoke')
                  .offsets
                  .map((offset) {
                return Positioned(
                  left: offset.offset.dx,
                  top: offset.offset.dy,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoScreen(
                                videoUrl: offset.videoUrl,
                                offset: offset.offset,
                              ),
                            ));
                      },
                      child: Transform.scale(
                          scale: 0.08,
                          child: Image.asset(
                              'lib/assets/grenade_icon/smoke_icon.png'))),
                );
              }).toList(),
            ),
          if (showFlash)
            Stack(
              children: grenades
                  .firstWhere((g) => g.name == 'Flash')
                  .offsets
                  .map((offset) {
                return Positioned(
                  left: offset.offset.dx,
                  top: offset.offset.dy,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoScreen(
                                videoUrl: offset.videoUrl,
                                offset: offset.offset,
                              ),
                            ));
                      },
                      child: Transform.scale(
                          scale: 0.08,
                          child: Image.asset(
                              'lib/assets/grenade_icon/flash_icon.png'))),
                );
              }).toList(),
            ),
          if (showMolotov)
            Stack(
              children: grenades
                  .firstWhere((g) => g.name == 'Molotov')
                  .offsets
                  .map((offset) {
                return Positioned(
                  left: offset.offset.dx,
                  top: offset.offset.dy,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoScreen(
                                videoUrl: offset.videoUrl,
                                offset: offset.offset,
                              ),
                            ));
                      },
                      child: Transform.scale(
                          scale: 0.08,
                          child: Image.asset(
                              'lib/assets/grenade_icon/fire_icon.png'))),
                );
              }).toList(),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors
                .transparent, // установить прозрачный цвет фона контейнера
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
