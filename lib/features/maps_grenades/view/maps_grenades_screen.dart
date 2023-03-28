import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/models/map_data.dart';
import 'package:photo_view/photo_view.dart';

import '../../../repositories/maps/models/map_grenades_data.dart';

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
            enablePanAlways: true,
            imageProvider: widget.mapImage.image,
          ),
          if (showSmoke)
            Positioned(left: 100, top: 40,child: Image.asset('lib/assets/grenade_icon/smoke.png')),
          if (showFlash) Positioned(left: 122, top: 53,child: Image.asset('lib/assets/grenade_icon/flash.png')),
          if (showMolotov) Positioned(left: 200, top: 150,child: Image.asset('lib/assets/grenade_icon/moly.png')),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
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
    );
  }
}
