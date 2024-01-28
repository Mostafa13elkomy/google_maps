import 'package:dio/dio.dart';
import 'package:google_maps/constants/my_strings.dart';

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
        'key': googleMapsApiKey,
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
      Response response = await dio.get(placeLocationBaseUrl, queryParameters: {
        'place_id': placeId,
        'types': 'geometry',
        'key': googleMapsApiKey,
        'sessiontoken': sessionToken,
      });
      return response.data;
    } catch (error) {
      return Future.error(
        'place location error : ',
        StackTrace.fromString('this is its trace'),
      );
    }
  }
}
