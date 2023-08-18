import 'package:flutter/material.dart';
import 'package:csgo_grenades/router/router.dart';
import 'package:csgo_grenades/theme/theme.dart';

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
