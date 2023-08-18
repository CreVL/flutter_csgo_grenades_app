import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:csgo_grenades/firebase_options.dart';
import 'package:csgo_grenades/map_list_app.dart';
import 'package:csgo_grenades/repositories/maps/abstract_maps_repository.dart';
import 'package:csgo_grenades/repositories/maps/maps_grenades_repository.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.I.registerLazySingleton<AbstractMapsRepository>(() => MapsGrenadesRepository());
  runApp(const MapsList());
}
