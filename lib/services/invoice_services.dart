import 'dart:convert' as convert;
import 'package:Honeydu/models/InvoiceResponse.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';
import 'package:Honeydu/utils/basicUrl.dart';
import 'package:http/http.dart' as http;

Future<InvoiceResponse> payInvoice({int id}) async {
  String accessToken = await loadAuthkey();

  var response = await http.put(
    Uri.parse(basicUrl + "/pay-invoice/${id}"),
    headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': '$accessToken'
    },
  );
  var json = convert.jsonDecode(response.body);
  return InvoiceResponse(json['status'], json['message'], response.statusCode);
}

Future<InvoiceResponse> rejectInvoice({int id}) async {
  String accessToken = await loadAuthkey();
  var response = await http.put(
    Uri.parse(basicUrl + "/reject-invoice/${id}"),
    headers: <String, String>{
      'Accept': 'application/json',
      'Authorization': '$accessToken'
    },
  );
  var json = convert.jsonDecode(response.body);
  return InvoiceResponse(json['status'], json['message'], response.statusCode);
}
