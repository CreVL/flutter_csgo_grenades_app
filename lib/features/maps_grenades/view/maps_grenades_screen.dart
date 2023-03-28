import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/models/map_data.dart';
import 'package:photo_view/photo_view.dart';

import '../../../repositories/maps/models/map_grenades_data.dart';

class MapsGrenadesScreen extends StatefulWidget {
  const MapsGrenadesScreen({Key? key}) : super(key: key);

  @override
  State<MapsGrenadesScreen> createState() => _MapsGrenadesScreenState();
}

class _MapsGrenadesScreenState extends State<MapsGrenadesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MapGrenadesScreen extends StatelessWidget {
  const MapGrenadesScreen(
      {super.key, required this.title, required this.mapImage});

  final String title;
  final Image mapImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title')),
      body: PhotoView(
        enablePanAlways: true,
        imageProvider: mapImage.image,
      ),
    );
  }
}
