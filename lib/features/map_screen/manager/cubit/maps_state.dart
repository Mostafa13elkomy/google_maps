part of 'maps_cubit.dart';

@immutable
sealed class MapsState {}

class MapsInitial extends MapsState {}

// ignore: must_be_immutable
class PlacesLoaded extends MapsState {
  List<dynamic> places;
  PlacesLoaded({
    required this.places,
  });
}

class PlaceLocationLoaded extends MapsState {
   final Place place;

  PlaceLocationLoaded(this.place);
}
