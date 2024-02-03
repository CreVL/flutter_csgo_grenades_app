import 'package:flutter/material.dart';

class GrenadeData {
  final String name;

  final List<GrenadeOffset> offsets;

  GrenadeData({
    required this.name,
    required this.offsets,
  });
}

class GrenadeOffset {
  final double offsetX;
  final double offsetY;
  final String videoUrl;

  GrenadeOffset({
    required this.offsetX,
    required this.offsetY,
    required this.videoUrl,
  });
}
