import 'package:Honeydu/models/signUp.dart';
import 'package:Honeydu/utils/basicUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<SignupResults> signUp({
  String instagram,
  String firstname,
  String lastname,
  String companyname,
  String email,
  String phoneNumber,
}) async {
  var response = await http
      .post(Uri.parse(basicUrl + "/register"), headers: <String, String>{
    'Accept': 'application/json',
  }, body: {
    "email": email,
    "phone_number": phoneNumber,
    "first_name": firstname,
    "last_name": lastname,
    "company_name": companyname,
    "instagram": instagram,
  });
  var json = convert.jsonDecode(response.body);
  if (response.statusCode != 200) {
    Map error = json['error'];
    return SignupResults.fromJson(error, response.statusCode, json['message']);
  } else {
    return SignupResults.fromJson(null, response.statusCode, json['message']);
  }
}
