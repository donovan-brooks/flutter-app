import 'package:dio/dio.dart';
import 'package:Honeydu/models/baseUrl.dart';
import 'package:Honeydu/models/business_verification_responses.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';

Future<BusinessVerificationResponse>
    businessPersonalAccountRegistrationServices({
  String accountNumber,
  String businessName,
  String addressLine1,
  String addressLine2,
  String city,
  String state,
  String postalCode,
  String firstName,
  String lastName,
  String dateOfBirth,
  bool isBusinessAccount,
}) async {
  String accessToken = await loadAuthkey();
  FormData formData = isBusinessAccount
      ? new FormData.fromMap({
          "ein": accountNumber != null ? accountNumber : "",
          "business_name": businessName,
          "line_1": addressLine1,
          "city": city,
          "state": state,
          "postal_code":
              postalCode != null && postalCode.isNotEmpty ? postalCode : ""
        })
      : new FormData.fromMap({
          "ssn": accountNumber != null ? accountNumber : "",
          "line_1": addressLine1,
          "city": city,
          "state": state,
          "postal_code": postalCode != null && postalCode.isNotEmpty
              ? int.parse(postalCode)
              : "",
          "first_name": firstName,
          "last_name": lastName,
          "date_of_birth": dateOfBirth
        });
  Dio dio = Dio();
  Response response;

  try {
    response = await dio.post(
      baseUrl + "/business-details",
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status <= 500;
        },
        headers: <String, String>{
          'Accept': 'application/json',
          'Content-type': 'application/json',
          'Authorization': accessToken,
        },
      ),
    );
  } catch (e) {
    print("Error is $e");
  }

  String message;
  String statusMessage;
  Map<dynamic, dynamic> errors;
  var json = response.data;
  if (response.statusCode != 200) {
    if (response.statusCode == 406) {
      message = json['message'];
      statusMessage = json['status'];
      return BusinessVerificationResponse.fromJson(
          null, response.statusCode, message, statusMessage);
    } else if (response.statusCode == 422) {
      message = json['message'];
      errors = json['errors'];
      return BusinessVerificationResponse.fromJson(
          errors, response.statusCode, message, null);
    } else {
      return BusinessVerificationResponse.fromJson(
          null, response.statusCode, "Failed", "UnExpected Error");
    }
  } else {
    message = json['message'];
    statusMessage = json['status'];
    return BusinessVerificationResponse.fromJson(
        null, response.statusCode, message, statusMessage);
  }
}
