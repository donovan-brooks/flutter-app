import 'package:Honeydu/utils/basicUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<String> _results = [];
Future<List<String>> signIn({
  String phoneNumber,
}) async {
  var message = '';
  _results.clear();
  print(phoneNumber);
  var response =
      await http.post(Uri.parse(basicUrl + "/login"), headers: <String, String>{
    'Accept': 'application/json',
  }, body: {
    "phone_number": phoneNumber,
  });
  var json = convert.jsonDecode(response.body);
  _results.insert(0, response.statusCode.toString());
  if (response.statusCode != 200) {
    Map error = json['error'];
    message = json['message'] != null ? json['message'] : null;
    var numberError;
    _results.insert(1, message);

    try {
      numberError = error['phone_number'][0];
    } catch (error) {
      numberError = null;
    }
    _results.insert(2, numberError);
  } else {
    _results.insert(1, json['status']);
    _results.insert(2, json['message']);
  }
  return _results;
}
