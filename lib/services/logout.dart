import 'package:dio/dio.dart';
import 'package:Honeydu/models/baseUrl.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';

void logoutService() async {
  Dio _dio = Dio();
  await _dio.post(
    baseUrl + "/logout",
    options: Options(
      followRedirects: false,
      validateStatus: (status) {
        return status <= 500;
      },
      headers: <String, String>{
        'Accept': 'application/json',
        'Authorization': await loadAuthkey(),
      },
    ),
  );
}
