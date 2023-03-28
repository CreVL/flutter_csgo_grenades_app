import 'package:flutter/material.dart';
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
              children: smokeOffsets.map((offset) {
                return Positioned(
                  left: offset.dx,
                  top: offset.dy,
                  child: Transform.scale(scale: 0.08,child: Image.asset('lib/assets/grenade_icon/smoke_icon.png')),
                );
              }).toList(),
            ),
          if (showFlash) Stack(
            children: flashOffsets.map((offset) {
              return Positioned(
                left: offset.dx,
                top: offset.dy,
                child: Transform.scale(scale: 0.08,child: Image.asset('lib/assets/grenade_icon/flash_icon.png')),
              );
            }).toList(),
          ),
          if (showMolotov) Stack(
            children: molyOffsets.map((offset) {
              return Positioned(
                left: offset.dx,
                top: offset.dy,
                child: Transform.scale(scale: 0.07,child: Image.asset('lib/assets/grenade_icon/fire_icon.png')),
              );
            }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          decoration:const BoxDecoration(
            color: Colors.transparent, // установить прозрачный цвет фона контейнера
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
