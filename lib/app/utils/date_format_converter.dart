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

String getFormattedDateFromToday() {
  DateTime now = DateTime.now();
  String formattedDate = '${_getWeekDay(now)}, ${now.day} ${_getMonth(now)} de ${now.year}';
  return formattedDate;
}

String _getWeekDay(DateTime date) {
  List<String> weekDays = ['Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'];
  return weekDays[date.weekday - 1];
}

String _getMonth(DateTime date) {
  List<String> months = ['janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro'];
  return months[date.month - 1];
}