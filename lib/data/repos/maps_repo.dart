import 'package:google_maps/data/models/place_suggestion.dart';
import 'package:google_maps/data/web_services/places_web_services.dart';

class MapsRepos {
  final PlacesWebServices placesWebServices;

  MapsRepos(this.placesWebServices);
  Future<List<dynamic>> fetchSuggestion(
      String place, String sessionToken) async {
    final suggestions =
        await placesWebServices.fetchSuggestions(place, sessionToken);
    return suggestions
        .map(
          (suggestion) => PlaceSuggestion.fromJson(suggestion),
        )
        .toList();
  }
}
