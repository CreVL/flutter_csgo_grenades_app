import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/features/maps_list/widgets/maps_cs_tile.dart';

import '../../../repositories/maps/models/models.dart';
import '../../maps_grenades/view/view.dart';

class MapsListScreen extends StatefulWidget {
  const MapsListScreen({Key? key}) : super(key: key);

  @override
  State<MapsListScreen> createState() => _MapsListScreenState();
}

class _MapsListScreenState extends State<MapsListScreen> {
  final List<MapData> _maps = [
    const MapData(
      mapImage:
          Image(image: AssetImage('lib/assets/maps_grenades/map_mirage.png')),
      mapLogo: Image(
        image: AssetImage('lib/assets/maps_logo/mirage.png'),
      ),
      mapId: 'map1',
      title: 'Mirage',
    ),
    const MapData(
      mapImage:
          Image(image: AssetImage('lib/assets/maps_grenades/map_dust.png')),
      mapLogo: Image(
        image: AssetImage('lib/assets/maps_logo/dust.png'),
      ),
      mapId: 'map2',
      title: 'Dust2',
    ),
    const MapData(
      mapImage:
          Image(image: AssetImage('lib/assets/maps_grenades/map_inferno.png')),
      mapLogo: Image(
        image: AssetImage('lib/assets/maps_logo/inferno.png'),
      ),
      mapId: 'map3',
      title: 'Inferno',
    ),
    const MapData(
      mapImage:
          Image(image: AssetImage('lib/assets/maps_grenades/map_overpass.png')),
      mapLogo: Image(
        image: AssetImage('lib/assets/maps_logo/overpass.png'),
      ),
      mapId: 'map4',
      title: 'Overpass',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maps'),
      ),
      body: Column(
        children: List.generate(_maps.length, (index) {
          final map = _maps[index];
          return Expanded(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MapGrenadesScreen(
                      title: map.title,
                      mapImage: map.mapImage,
                    ),
                  ));
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
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [
                    Color(0xFFFFD100),
                    Color(0xFFFFFFFF),
                    Color(0xFFFFD100),
                  ])),
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
          ));
        }),
      ),
    );
  }
}

