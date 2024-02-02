import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceDirection {
  late LatLngBounds bounds;
  late List<PointLatLng> polyLinePoints;
  late String totalDistance;
  late String totalDuration;

  PlaceDirection({
    required this.bounds,
    required this.polyLinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory PlaceDirection.fromJson(Map<String, dynamic> json) {
    final data = Map<String, dynamic>.from(json['routes'][0]);
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      southwest: LatLng(southwest['lat'], southwest['lng']),
      northeast: LatLng(northeast['lat'], northeast['lng']),
    );

    late String distance;
    late String duration;
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }
    return PlaceDirection(
        bounds: bounds,
        polyLinePoints: PolylinePoints()
            .decodePolyline(data['overview_polyline']['points']),
        totalDistance: distance,
        totalDuration: duration);
  }
}
