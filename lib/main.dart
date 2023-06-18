import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_csgo_grenades_app/firebase_options.dart';
import 'package:flutter_csgo_grenades_app/map_list_app.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/abstract_maps_repository.dart';
import 'package:flutter_csgo_grenades_app/repositories/maps/maps_grenades_repository.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.I.registerLazySingleton<AbstractMapsRepository>(() => MapsGrenadesRepository());
  runApp(const MapsList());
}
