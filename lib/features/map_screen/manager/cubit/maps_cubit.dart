import 'package:bloc/bloc.dart';
import 'package:google_maps/data/models/place_model.dart';
import 'package:meta/meta.dart';
import 'package:google_maps/data/repos/maps_repo.dart';

part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsRepos mapsRepos;

  MapsCubit(
    this.mapsRepos,
  ) : super(MapsInitial());

  void emitPlacesSuggestion(String place, String sessionToken) {
    mapsRepos.fetchSuggestion(place, sessionToken).then((suggestion) {
      emit(PlacesLoaded(places: suggestion));
    });
  }

    void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepos.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlaceLocationLoaded(place));
    });
  }
}
