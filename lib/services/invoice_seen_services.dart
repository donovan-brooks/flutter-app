import 'package:Honeydu/utils/basicUrl.dart';
import 'package:dio/dio.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';

Future<int> invoiceSeen(int invoiceId) async {
  String accessToken = await loadAuthkey();
  Dio dio = Dio();
  Response response;
  try {
    response = await dio.get(
      basicUrl + "/view-invoice/$invoiceId",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': '$accessToken',
        },
      ),
    );
  } on Exception catch (e) {
    print(e);
  }
  return response.statusCode;
}
