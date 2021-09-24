class EditProfileResponse {
  final int status;
  final String message;
  final String firstNameError;
  final String lastNameError;
  final String emailError;
  final String instagramError;
  final String companyNameError;

  EditProfileResponse({
    this.status,
    this.message,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.companyNameError,
    this.instagramError,
  });
  EditProfileResponse.fromJson(
      Map<String, dynamic> errorJson, int statuscode, String message)
      : emailError = (errorJson != null)
            ? errorJson['email'] != null
                ? errorJson['email'][0]
                : null
            : null,
        firstNameError = errorJson != null
            ? errorJson['first_name'] != null
                ? errorJson['first_name'][0]
                : null
            : null,
        instagramError = errorJson != null
            ? errorJson['instagram'] != null
                ? errorJson['instagram'][0]
                : null
            : null,
        companyNameError = errorJson != null
            ? errorJson['company_name'] != null
                ? errorJson['company_name'][0]
                : null
            : null,
        lastNameError = errorJson != null
            ? errorJson['last_name'] != null
                ? errorJson['last_name'][0]
                : null
            : null,
        status = statuscode,
        message = message;
}
