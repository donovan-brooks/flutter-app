class WithdrawMoneyResponse {
  final int statusCode;
  final String status;
  final String message;
  final List<dynamic> errors;

  WithdrawMoneyResponse({
    this.statusCode,
    this.status,
    this.message,
    this.errors,
  });

  WithdrawMoneyResponse.fromJson(
    Map<String, dynamic> errorJson,
    int statuscode,
    String message,
    String statusMessage,
  )   : this.errors = (errorJson != null)
            ? errorJson['amount'] != null
                ? errorJson['amount']
                : null
            : null,
        status = statusMessage,
        statusCode = statuscode,
        message = message;
}
