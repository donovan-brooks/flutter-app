import 'package:dio/dio.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';

class BalanceDetails {
  final String available;
  final String pending;
  BalanceDetails(this.available, this.pending);
}

Future<BalanceDetails> inquiryBalance() async {
  final String authKey = await loadAuthkey();
  Dio dio = Dio();
  Response response;
  try {
    response = await dio.get(
      "https://staging.honeydu.io/api/get-balance",
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },
        headers: {'Accept': 'application/json', 'Authorization': '$authKey'},
      ),
    );
  } on Exception catch (e) {
    print(e);
  }
  return response != null && response.statusCode == 200
      ? BalanceDetails(
          response.data['available_balance'], response.data['pending_balance'])
      : BalanceDetails("0", "0");
}
