import 'package:Honeydu/services/shared_preferences_services.dart';
import 'package:Honeydu/utils/basicUrl.dart';
import 'package:http/http.dart' as http;

Future<int> sendReminder({int id}) async {
  String accessToken = await loadAuthkey();

  var response = await http.put(
    Uri.parse(basicUrl + "/send-reminder/${id}"),
    headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': '$accessToken'
    },
  );
  return response.statusCode;
}
