import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/router/router.dart';
import 'package:flutter_csgo_grenades_app/theme/theme.dart';

class MapsList extends StatelessWidget {
  const MapsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      title: 'Maps',
      theme: darkTheme,
    );
  }
}
