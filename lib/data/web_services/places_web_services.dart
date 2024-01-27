import 'package:dio/dio.dart';
import 'package:google_maps/constants/my_strings.dart';

class PlacesWebServices {
  late Dio dio;

  PlacesWebServices() {
    BaseOptions options = BaseOptions(
        connectTimeout: const Duration(milliseconds: 600),
        receiveTimeout: const Duration(milliseconds: 600),
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
      return response.data["predictions"];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
