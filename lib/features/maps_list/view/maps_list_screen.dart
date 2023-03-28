import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/features/maps_list/widgets/maps_cs_tile.dart';

class MapsListScreen extends StatefulWidget {
  const MapsListScreen({Key? key}) : super(key: key);

  @override
  State<MapsListScreen> createState() => _MapsListScreenState();
}

class _MapsListScreenState extends State<MapsListScreen> {
  final List<MapData> _maps = [
    const MapData(
        imageMaps: Image(
          image: AssetImage('lib/assets/mapsList/mirage.png'),
        ),
        mapId: 'map1'),
    const MapData(
        imageMaps: Image(
          image: AssetImage('lib/assets/mapsList/dust.png'),
        ),
        mapId: 'map2'),
    const MapData(
        imageMaps: Image(
          image: AssetImage('lib/assets/mapsList/inferno.png'),
        ),
        mapId: 'map3'),
    const MapData(
        imageMaps: Image(
          image: AssetImage('lib/assets/mapsList/overpass.png'),
        ),
        mapId: 'map4'),
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
                MaterialPageRoute(builder: (_) => MapScreen(mapId: map.mapId)),
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
                      image: map.imageMaps.image,
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

class MapData {
  const MapData({required this.imageMaps, required this.mapId});

  final Image imageMaps;
  final String mapId;
}

class MapScreen extends StatelessWidget {
  const MapScreen({required this.mapId});

  final String mapId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Карта $mapId')),
      body: Center(
        child: Text('Здесь будет карта $mapId'),
      ),
    );
  }
}
