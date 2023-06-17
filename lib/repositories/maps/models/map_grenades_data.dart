import 'package:flutter/material.dart';
class Grenade {
  final String name;
  final List<GrenadeOffset> offsets;

  Grenade({
    required this.name,
    required this.offsets,
  });
}

class GrenadeOffset {
  final Offset offset;
  final String videoUrl;

  GrenadeOffset({
    required this.offset,
    required this.videoUrl,
  });
}
