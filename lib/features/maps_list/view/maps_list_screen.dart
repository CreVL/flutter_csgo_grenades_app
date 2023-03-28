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
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(_maps.length, (index) {
          final map = _maps[index];
          return Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MapScreen(mapId: map.mapId)),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Align(
                alignment: Alignment.center,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        map.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
        }),
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
