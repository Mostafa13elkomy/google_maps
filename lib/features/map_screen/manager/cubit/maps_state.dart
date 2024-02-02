part of 'maps_cubit.dart';

@immutable
sealed class MapsState {}

class MapsInitial extends MapsState {}

// ignore: must_be_immutable
class PlacesLoaded extends MapsState {
  List<PlaceSuggestion> places;
  PlacesLoaded({
    required this.places,
  });
}

class PlaceLocationLoaded extends MapsState {
    final Place place;

  PlaceLocationLoaded(this.place);
}


class PlaceDirectionsLoaded extends MapsState {
    final PlaceDirection placeDirection;

  PlaceDirectionsLoaded(this.placeDirection);
}