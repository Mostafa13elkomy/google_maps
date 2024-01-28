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
        'key': 'AIzaSyB6CoqsAN_FesP4Kf-1bKvOCLcWCjDTrNA',
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
}
