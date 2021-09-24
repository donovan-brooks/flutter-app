import 'package:dio/dio.dart';
import 'package:Honeydu/models/baseUrl.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';
import '../models/send_invoice_items.dart';

List _results = [];

Future<List<dynamic>> sendInvoice({SendInvoice sendInvoice}) async {
  FormData formData = new FormData.fromMap({
    "customer_email": sendInvoice.customerEmail,
    "due_date": sendInvoice.dueDate,
    "total": sendInvoice.total,
    "image": "",
    "payment_request_note": sendInvoice.paymentRequestNote,
    "items": sendInvoice.items,
  });
  _results.clear();
  String accessToken = await loadAuthkey();
  Dio dio = Dio();
  Response response;

  try {
    response = await dio.post(
      baseUrl + "/invoice",
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization': accessToken,
        },
      ),
    );
  } catch (e) {}

  var json = response.data;
  _results.insert(0, response.statusCode);
  if (response.statusCode != 200) {
    String message = json['message'];
    var errors = json['errors'];
    if (errors != null) {
      _results.insert(1, message);
      var emailError =
          errors['customer_email'] != null ? errors['customer_email'][0] : null;
      var dateError = errors['due_date'] != null ? errors['due_date'][0] : null;
      var totalError = errors['total'] != null ? errors['total'][0] : null;
      var paymentNoteError = errors['payment_request_note'] != null
          ? errors['payment_request_note'][0]
          : null;
      _results.insert(2, emailError);
      _results.insert(3, dateError);
      _results.insert(4, totalError);
      _results.insert(5, paymentNoteError);
    } else {
      _results.insert(1, "Something went wrong!");
      _results.insert(2, null);
      _results.insert(3, null);
      _results.insert(4, null);
      _results.insert(5, null);
    }
  }
  return _results;
}
