import '../models/send_invoice_items.dart';
import 'package:http/http.dart' as http;

sendInvoicePdf({SendInvoice sendInvoice}) async {
  // Dio dio = Dio();
  // Response response;

  try {
    await http.post(
      Uri.https("staging.honeydu.io", "/api/invoice/pdf"),
      headers: <String, String>{
        'Accept': 'application/pdf',
        'Authorization': "Bearer 30|X0RL6FdlOuEt1OWBhqtlBm7J0BkCLXIg1TZwp9Y4",
      },
      body: {
        "customer_email": "arslankaleem71@gmail.com",
        "due_date": "28/10/2021",
        "total": "3000",
        "image": "",
        "payment_request_note": "Hello There",
        "items": [
          {
            "title": "Online Payment",
            "price": "300",
            "description": "This is the payment for mobile phone",
            "quantity": "10"
          }
        ]
      },
    ).then((value) async {
      print(value.body.runtimeType);
      return;
    });
  } catch (e) {
    print("Error is $e");
  }
  return;
}
