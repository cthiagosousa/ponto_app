import 'package:intl/intl.dart';

String dateNow() {
  return DateFormat("dd/MM/yyyy", "pt-BR").format(DateTime.now());
}