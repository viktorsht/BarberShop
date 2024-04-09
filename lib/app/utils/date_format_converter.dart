import 'package:intl/intl.dart';

String getCurrentDate() {
  DateTime now = DateTime.now();
  String formattedDate = '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}';
  return formattedDate;
}


String formattedDate(String date) {
  DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
  return '${parsedDate.day}';
}

String monthName(String date) {
  DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
  return DateFormat('MMMM').format(parsedDate);
}