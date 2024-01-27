import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps/constants/my_constants.dart';
import 'package:google_maps/data/models/place_suggestion.dart';
import 'package:google_maps/features/map_screen/manager/cubit/maps_cubit.dart';
import 'package:google_maps/features/map_screen/widgets/my_drawer.dart';
import 'package:google_maps/features/otp_screen/manager/cubit/phone_auth_cubit.dart';
import 'package:google_maps/helper/location_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  FloatingSearchBarController controller = FloatingSearchBarController();

  static Position? position;
  List<dynamic> places = [];
  final Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> _goToMyCurrentLocation() async {
    GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition),
    );
  }

  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Widget _buildMap() {
    return GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: _myCurrentLocationCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
        });
  }

  Widget buildFloatingSearchBar() {
    final isPortrate =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      controller: controller,
      elevation: 6,
      border: const BorderSide(style: BorderStyle.none),
      width: isPortrate ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      axisAlignment: isPortrate ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      hintStyle: const TextStyle(fontSize: 18),
      hint: 'Find a place..',
      height: 52,
      iconColor: MyColors.blue,
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      onQueryChanged: (query) {},
      onFocusChanged: (_) {},
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
              icon: Icon(
                Icons.place,
                color: Colors.black.withOpacity(0.6),
              ),
              onPressed: () {}),
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildSuggestionsBloc(),
            ],
          ),
        );
      },
    );
  }

  Widget buildSuggestionsBloc() {
    return BlocBuilder<MapsCubit, MapsState>(builder: ((context, state) {
      if (state is PlacesLoaded) {
        places = state.places;
        if(places.isNotEmpty){
          return buildPlacesList()
      }else{
        return Container();
      }
      }else{
        return Container();
      }
    }),);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? _buildMap()
              : Center(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: const CircularProgressIndicator(
                      color: MyColors.blue,
                    ),
                  ),
                ),
          buildFloatingSearchBar()
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: MyColors.blue,
          onPressed: _goToMyCurrentLocation,
          child: const Icon(
            Icons.place,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
