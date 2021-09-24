import 'package:dio/dio.dart';
import 'package:Honeydu/models/baseUrl.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';

Future<bool> businessVerificationServices() async {
  String accessToken = await loadAuthkey();
  Dio dio = Dio();
  Response response;

  try {
    response = await dio.get(
      baseUrl + "/business-verification-check",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': accessToken,
        },
      ),
    );
  } catch (e) {}
  return response.data;
}
