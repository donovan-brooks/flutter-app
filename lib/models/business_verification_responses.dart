class BusinessVerificationResponse {
  final int status;
  final String postalCodeError;
  final String stateError;
  final String statusMessage;
  final String message;
  final String addressError;
  final String cityError;
  final String dateofbirthError;
  final String firstNameError;
  final String ssnError;
  final String einError;
  final String lastNameError;
  final String businessNameError;

  BusinessVerificationResponse({
    this.postalCodeError,
    this.stateError,
    this.addressError,
    this.cityError,
    this.dateofbirthError,
    this.firstNameError,
    this.ssnError,
    this.einError,
    this.lastNameError,
    this.status,
    this.message,
    this.statusMessage,
    this.businessNameError,
  });
  BusinessVerificationResponse.fromJson(Map<String, dynamic> errorJson,
      int statuscode, String message, String statusMessage)
      : postalCodeError = (errorJson != null)
            ? errorJson['postal_code'] != null
                ? errorJson['postal_code'][0]
                : null
            : null,
        businessNameError = (errorJson != null)
            ? errorJson['business_name'] != null
                ? errorJson['business_name'][0]
                : null
            : null,
        stateError = errorJson != null
            ? errorJson['state'] != null
                ? errorJson['state'][0]
                : null
            : null,
        addressError = errorJson != null
            ? errorJson['line_1'] != null
                ? errorJson['line_1'][0]
                : null
            : null,
        cityError = errorJson != null
            ? errorJson['city'] != null
                ? errorJson['city'][0]
                : null
            : null,
        lastNameError = errorJson != null
            ? errorJson['last_name'] != null
                ? errorJson['last_name'][0]
                : null
            : null,
        dateofbirthError = errorJson != null
            ? errorJson['date_of_birth'] != null
                ? errorJson['date_of_birth'][0]
                : null
            : null,
        firstNameError = errorJson != null
            ? errorJson['first_name'] != null
                ? errorJson['first_name'][0]
                : null
            : null,
        ssnError = errorJson != null
            ? errorJson['ssn'] != null
                ? errorJson['ssn'][0]
                : null
            : null,
        einError = errorJson != null
            ? errorJson['ein'] != null
                ? errorJson['ein'][0]
                : null
            : null,
        statusMessage = statusMessage,
        status = statuscode,
        message = message;
}
