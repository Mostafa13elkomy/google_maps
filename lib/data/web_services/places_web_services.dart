import 'package:dio/dio.dart';
import 'package:google_maps/constants/my_strings.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesWebServices {
  late Dio dio;

  PlacesWebServices() {
    BaseOptions options = BaseOptions(
        connectTimeout: const Duration(minutes: 6000000000000000000),
        receiveTimeout: const Duration(minutes: 6000000000000000000),
        receiveDataWhenStatusError: true);
    dio = Dio(options);
  }
  Future<List<dynamic>> fetchSuggestions(
      String place, String sessionToken) async {
    try {
      Response response = await dio.get(suggestionBaseUrl, queryParameters: {
        'input': place,
        'types': 'address',
        'components': 'country:eg',
        'key': "AIzaSyDXl_L7a9MIlDg_bR3CEuBGLK0WBBE3pW0",
        'sessiontoken': sessionToken,
      });
      print(response.data['predictions']);
      print(response.statusCode);
      return response.data["predictions"];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocation(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(
        placeLocationBaseUrl,
        queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': "AIzaSyDXl_L7a9MIlDg_bR3CEuBGLK0WBBE3pW0",
          'sessiontoken': sessionToken
        },
      );
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace'),),);
    }
  }

  // origin means current location
  // destination means searched for location
  Future<dynamic> getDirections(LatLng origin,LatLng destination) async {
    try {
      Response response = await dio.get(
        placeDirectionsBaseUrl,
        queryParameters: {
          'origin':'${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': "AIzaSyDXl_L7a9MIlDg_bR3CEuBGLK0WBBE3pW0",
        },
      );
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace'),),);
    }
  }

  
}
