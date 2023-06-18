import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/maps_grenades.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/maps/models/models.dart';
import '../../maps_grenades/view/view.dart';

class MapsListScreen extends StatefulWidget {
  const MapsListScreen({Key? key}) : super(key: key);

  @override
  State<MapsListScreen> createState() => _MapsListScreenState();
}

class _MapsListScreenState extends State<MapsListScreen> {
  List<MapData> _maps = [];

  @override
  void initState() {
    super.initState();
    _loadMapsData();
  }

  Future<void> _loadMapsData() async {
    _maps = await GetIt.I<AbstractMapsRepository>().loadMapData();
    setState(() {});
  }

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
                    builder: (_) => MapsGrenadesScreen(
                      title: map.title,
                      mapImage: map.mapImage,
                      mapId: map.mapId,
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

