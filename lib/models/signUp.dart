class SignupResults {
  final int status;
  final String firstnameError;
  final String lastNameError;
  final String emailError;
  final String companyNameError;
  final String instagramError;
  final String phoneNumberError;
  final String message;

  SignupResults({
    this.status,
    this.firstnameError,
    this.lastNameError,
    this.emailError,
    this.companyNameError,
    this.instagramError,
    this.phoneNumberError,
    this.message,
  });
  SignupResults.fromJson(
      Map<String, dynamic> errorJson, int statuscode, String message)
      : companyNameError = (errorJson != null)
            ? errorJson['company_name'] != null
                ? errorJson['company_name'][0]
                : null
            : null,
        emailError = errorJson != null
            ? errorJson['email'] != null
                ? errorJson['email'][0]
                : null
            : null,
        firstnameError = errorJson != null
            ? errorJson['first_name'] != null
                ? errorJson['first_name'][0]
                : null
            : null,
        instagramError = errorJson != null
            ? errorJson['instagram'] != null
                ? errorJson['instagram'][0]
                : null
            : null,
        lastNameError = errorJson != null
            ? errorJson['last_name'] != null
                ? errorJson['last_name'][0]
                : null
            : null,
        phoneNumberError = errorJson != null
            ? errorJson['phone_number'] != null
                ? errorJson['phone_number'][0]
                : null
            : null,
        status = statuscode,
        message = message;
}
