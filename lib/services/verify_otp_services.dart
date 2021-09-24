import 'package:Honeydu/models/signIn.dart';
import 'package:Honeydu/utils/basicUrl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<PersonalInformation> verifyOtp({String phoneNumber, String otp}) async {
  var response = await http
      .post(Uri.parse(basicUrl + "/verify-otp"), headers: <String, String>{
    'Accept': 'application/json',
  }, body: {
    "phone_number": phoneNumber,
    "otp": otp,
  });
  var json = convert.jsonDecode(response.body);
  if (response.statusCode != 200) {
    var errorMessage = json['message'];
    return PersonalInformation.fromJson(
        null, response.statusCode, errorMessage);
  } else {
    var jsonResult = json['message'];
    return PersonalInformation.fromJson(jsonResult, response.statusCode, null);
  }
}
