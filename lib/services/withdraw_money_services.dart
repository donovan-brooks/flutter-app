import 'package:dio/dio.dart';
import 'package:Honeydu/models/baseUrl.dart';
import 'package:Honeydu/models/withdraw_money_response.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';

Future<WithdrawMoneyResponse> withdrawMoneyServices(String amount) async {
  FormData formData = new FormData.fromMap({
    "amount": amount,
  });
  String accessToken = await loadAuthkey();
  Dio _dio = Dio();
  Response response;

  try {
    response = await _dio.post(
      baseUrl + "/withdraw-money",
      data: formData,
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
  var json = response.data;
  Map error = json['error'] != null ? json['error'] : null;
  String status = json['status'] != null ? json['status'] : null;
  String message = json['message'] != null ? json['message'] : null;

  return WithdrawMoneyResponse.fromJson(
    error,
    response.statusCode,
    message,
    status,
  );
}
