import 'dart:convert' as convert;
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/utils/basicUrl.dart';
import 'package:http/http.dart' as http;
import 'package:Honeydu/services/shared_preferences_services.dart';

Future<InvoiceList> getInvoices() async {
  String accessToken = await loadAuthkey();
  var response = await http.get(Uri.parse(basicUrl + "/invoice"),
      headers: {'Accept': 'application/json', 'Authorization': '$accessToken'});
  var json = convert.jsonDecode(response.body);
  if (response.statusCode != 200) {
    var errorMessage = json['message'];
    return InvoiceList(null, response.statusCode, errorMessage);
  } else {
    var jsonResult = invoiceListFromJson(response.body);
    return InvoiceList(jsonResult, response.statusCode, null);
  }
}
