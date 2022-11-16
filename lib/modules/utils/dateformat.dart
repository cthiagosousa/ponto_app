import 'package:intl/intl.dart';

DateTime dateFormat(String date) {
  return DateFormat("dd/MM/yyyy", "pt_BR").parse(date);
}

String dateToString(DateTime date) {
  return DateFormat("dd/MM/yyyy", "pt_BR").format(date);
}
