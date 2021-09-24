import 'package:dio/dio.dart';
import 'package:Honeydu/models/baseUrl.dart';
import 'package:Honeydu/models/edit_profile_response.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';

Future<EditProfileResponse> editProfileServices(
    List<String> personalData) async {
  FormData formData = FormData.fromMap(
    {
      "first_name": personalData[2],
      "last_name": personalData[3],
      "company_name": personalData[4],
      "email": personalData[5],
      "instagram": personalData[6],
    },
  );
  print(personalData);
  Dio _dio = Dio();
  Response response;
  try {
    response = await _dio.post(
      baseUrl + "/profile",
      data: formData,
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
  } on Exception catch (e) {
    print(e);
  }
  print(response.data);
  if (response.statusCode == 200) {
    savePreferences(personalData);
    return EditProfileResponse.fromJson(
      null,
      response.statusCode,
      response.data["message"],
    );
  } else {
    return EditProfileResponse.fromJson(
      response.data["error"],
      response.statusCode,
      response.data["message"],
    );
  }
}
