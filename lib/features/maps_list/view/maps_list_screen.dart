import 'package:flutter/material.dart';

class MapsListScreen extends StatefulWidget {
  const MapsListScreen({Key? key}) : super(key: key);

  @override
  State<MapsListScreen> createState() => _MapsListScreenState();
}

class _MapsListScreenState extends State<MapsListScreen> {
  final List<MapData> _maps = [
    MapData(icon: Icons.map, title: 'Карта 1', mapId: 'map1'),
    MapData(icon: Icons.map, title: 'Карта 2', mapId: 'map2'),
    MapData(icon: Icons.map, title: 'Карта 3', mapId: 'map3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Maps'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          final map = _maps[index];
          return Center(
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MapScreen(mapId: map.mapId)),
                  );
                },
                child: Column(
                  children: [Icon(map.icon), Text(map.title)],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MapData {
  const MapData({required this.icon, required this.title, required this.mapId});

  final IconData icon;
  final String title;
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
