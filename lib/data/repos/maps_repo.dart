import 'package:google_maps/data/models/place_directions.dart';
import 'package:google_maps/data/models/place_model.dart';
import 'package:google_maps/data/models/place_suggestion.dart';
import 'package:google_maps/data/web_services/places_web_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsRepos {
  final PlacesWebServices placesWebServices;

  MapsRepos(this.placesWebServices);
Future<List<PlaceSuggestion>> fetchSuggestions(
      String place, String sessionToken) async {
    final suggestions =
        await placesWebServices.fetchSuggestions(place, sessionToken);

    return suggestions
        .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
        .toList();
  }

  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    final place =
        await placesWebServices.getPlaceLocation(placeId, sessionToken);
    // var readyPlace = Place.fromJson(place);
    return Place.fromJson(place);
  }

    Future<PlaceDirection> getPlaceDirection(LatLng origin,LatLng destination) async {
    final placeDirection =
        await placesWebServices.getDirections(origin,destination);
    // var readyPlace = Place.fromJson(place);
    return PlaceDirection.fromJson(placeDirection);
  }
}
