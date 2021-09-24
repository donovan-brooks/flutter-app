import 'package:intl/intl.dart';

String yyyyMMddFormat(DateTime dateTime) {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String formattedDate = dateFormat.format(dateTime);
  return formattedDate;
}

String ddMMyyyyFormat(DateTime dateTime) {
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  String formattedDate = dateFormat.format(dateTime);
  return formattedDate;
}

String MMddyyyyFormat(DateTime dateTime) {
  DateFormat dateFormat = DateFormat('MM/dd/yyyy');
  String formattedDate = dateFormat.format(dateTime);
  return formattedDate;
}
