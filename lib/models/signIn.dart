class PersonalInformation {
  final String token;
  final String name;
  final int id;
  final String companyName;
  final String email;
  final String imageUrl;
  final int status;
  final String errorMessage;
  final String instagram;

  PersonalInformation({
    this.status,
    this.token,
    this.name,
    this.id,
    this.companyName,
    this.email,
    this.imageUrl,
    this.errorMessage,
    this.instagram,
  });

  PersonalInformation.fromJson(
      Map<String, dynamic> parsedJson, int statuscode, String message)
      : status = statuscode,
        token = parsedJson != null ? parsedJson['token'] : null,
        name = parsedJson != null ? parsedJson['user']['name'] : null,
        id = parsedJson != null ? parsedJson['user']['id'] : null,
        email = parsedJson != null ? parsedJson['user']['email'] : null,
        companyName =
            parsedJson != null ? parsedJson['user']['company_name'] : null,
        imageUrl = parsedJson != null
            ? parsedJson['user']['profile_photo_path']
            : null,
        instagram = parsedJson != null ? parsedJson['user']['instagram'] : null,
        errorMessage = message != null ? message : null;
}
